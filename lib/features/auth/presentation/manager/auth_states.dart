sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangePasswordVisibility extends AuthStates {}

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

// Sign Out
class SignOutLoading extends AuthStates {}

class SignOutSuccess extends AuthStates {}

class SignOutFailure extends AuthStates {
  final String error;
  SignOutFailure({required this.error});
}
