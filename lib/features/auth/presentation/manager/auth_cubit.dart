import 'package:flutter/widgets.dart';

import '../../data/models/profile_model.dart';
import 'auth_states.dart';
import '../../data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  ProfileModel? profile;
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
      emit(LoginSuccess());
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
      emit(RegisterSuccess());
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
  }
}
