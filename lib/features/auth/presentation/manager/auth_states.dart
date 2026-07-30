sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangePasswordVisibility extends AuthStates {}

class ClearControllers extends AuthStates {}

// Login
class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {}

class LoginFailure extends AuthStates {
  final String error;
  LoginFailure({required this.error});
}

// Register
class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {}

class RegisterFailure extends AuthStates {
  final String error;
  RegisterFailure({required this.error});
}

// Send Reset Link
class SendResetLinkLoading extends AuthStates {}

class SendResetLinkSuccess extends AuthStates {}

class SendResetLinkFailure extends AuthStates {
  final String error;
  SendResetLinkFailure({required this.error});
}

// Resend Reset Link
class ResendResetLinkLoading extends AuthStates {}

class ResendResetLinkSuccess extends AuthStates {}

class ResendResetLinkFailure extends AuthStates {
  final String error;
  ResendResetLinkFailure({required this.error});
}

// Update Password
class UpdatePasswordLoading extends AuthStates {}

class UpdatePasswordSuccess extends AuthStates {}

class UpdatePasswordFailure extends AuthStates {
  final String error;
  UpdatePasswordFailure({required this.error});
}

// Sign Out
class SignOutLoading extends AuthStates {}

class SignOutSuccess extends AuthStates {}

class SignOutFailure extends AuthStates {
  final String error;
  SignOutFailure({required this.error});
}
