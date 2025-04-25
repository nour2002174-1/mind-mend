abstract class AuthLoginState {}

class LoginInitial extends AuthLoginState {}

class LoginLoading extends AuthLoginState {}

class LoginSuccess extends AuthLoginState {
  final String token;

  LoginSuccess(this.token);
}

class LoginFailure extends AuthLoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
