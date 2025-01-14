class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

class Registersuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

class Loginsuccess extends AuthState {}
