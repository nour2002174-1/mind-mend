import 'package:first_try/features/login/data/repo/auth_login_repo.dart';
import 'package:first_try/features/register/data/repo/auth_register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_login_state.dart';


class AuthLoginCubit_login extends Cubit<AuthLoginState> {
  final AuthRepository_login authRepository_login;

  AuthLoginCubit_login(this.authRepository_login) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await authRepository_login.login(email, password);
      if (response['token'] != null) {
        emit(LoginSuccess(response['token']));
      } else {
        emit(LoginFailure(response['message'] ?? 'Login failed'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
