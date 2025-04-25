import 'package:first_try/features/register/data/repo/auth_register_repo.dart';
import 'package:first_try/features/register/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());
   Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String birthday,
    required String status,
    required String address,
    required String mobile,
   required String specialist,
   required String type,
  }) async {
    emit(RegisterLoading());
    try {
      final user = await _authRepository.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        birthday: birthday,
        status: status,
        address: address,
        mobile: mobile,
        specialist: specialist,
        type: type,
      );
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(erMessage: e.toString()));
    }
  }
}