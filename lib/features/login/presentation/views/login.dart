import 'package:first_try/features/login/data/repo/auth_login_repo.dart';
import 'package:first_try/features/login/presentation/bloc/auth/auth_login_cubit.dart';
import 'package:first_try/features/login/presentation/views/widgets/login_view_body.dart';
import 'package:first_try/core/utils/api_server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthLoginCubit_login(AuthRepository_login(ApiService())),
        child: LoginViewBody(),
      ),
    );
  }
}
