class AuthState {}
class AuthInitial extends AuthState {}
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  String erMessage;
  RegisterFailure({required this.erMessage});
}