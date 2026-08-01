import '../../../../core/services/deep_link_service.dart';
import 'auth_states.dart';
import 'package:flutter/widgets.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileModel? profile;
  String resetEmailLink = "";
  bool isLoginPasswordVisible = false;
  bool isRegisterPasswordVisible = false;
  bool isRegisterConfirmPasswordVisible = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  DateTime birthday = DateTime.now().subtract(const Duration(days: 365 * 18));

  // Auto Login
  Future<void> autoLogin() async {
    final uri = await DeepLinkService.getInitialLink();
    if (uri != null && uri.scheme == 'surrah' && uri.host == 'reset-password') {
      emit(ForgetPasswordDeepLink());
      return;
    }
    emit(AutoLoginLoading());
    var data = await authRepo.autoLogin();
    data.fold((l) => emit(AutoLoginFailure(error: l.message)), (r) {
      profile = r;
      emit(AutoLoginSuccess(isProfileComplete: r.completeInitialSetup));
    });
  }

  // Register
  void changeRegisterPasswordVisibility() {
    isRegisterPasswordVisible = !isRegisterPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  void changeRegisterConfirmPasswordVisibility() {
    isRegisterConfirmPasswordVisible = !isRegisterConfirmPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  Future<void> register({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoading());
    var data = await authRepo.register(
      email: emailController.text,
      password: passwordController.text,
      profile: ProfileModel.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneController.text,
      ),
    );
    data.fold((l) => emit(RegisterFailure(error: l.message)), (r) {
      profile = r;
      clearControllers();
      emit(RegisterSuccess(profile: r));
    });
  }

  // Login
  void changeLoginPasswordVisibility() {
    isLoginPasswordVisible = !isLoginPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  Future<void> login({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoading());
    var data = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    data.fold((l) => emit(LoginFailure(error: l.message)), (r) {
      profile = r;
      clearControllers();
      emit(LoginSuccess(profile: r));
    });
  }

  // Send Reset Link
  Future<void> sendResetLink({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(SendResetLinkLoading());
    var data = await authRepo.sendResetLink(email: emailController.text);
    data.fold((l) => emit(SendResetLinkFailure(error: l.message)), (r) {
      resetEmailLink = emailController.text;
      clearControllers();
      emit(SendResetLinkSuccess());
    });
  }

  // Resend Reset Link
  Future<void> resendResetLink() async {
    emit(ResendResetLinkLoading());
    var data = await authRepo.sendResetLink(email: resetEmailLink);
    data.fold(
      (l) => emit(ResendResetLinkFailure(error: l.message)),
      (r) => emit(ResendResetLinkSuccess()),
    );
  }

  // Update Password
  Future<void> updatePassword({required GlobalKey<FormState> formKey}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(UpdatePasswordLoading());
    var data = await authRepo.updatePassword(
      newPassword: passwordController.text,
    );
    data.fold((l) => emit(UpdatePasswordFailure(error: l.message)), (r) {
      clearControllers();
      emit(UpdatePasswordSuccess());
    });
  }

  // Sign Out
  Future<void> signOut() async {
    emit(SignOutLoading());
    var data = await authRepo.signOut();
    data.fold((l) => emit(SignOutFailure(error: l.message)), (r) {
      profile = null;
      emit(SignOutSuccess());
    });
  }

  // Clear Controllers
  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emit(ClearControllers());
  }
}
