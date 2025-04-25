import 'package:first_try/features/register/data/repo/auth_register_repo.dart';
import 'package:first_try/features/register/presentation/bloc/auth/auth_cubit.dart';
import 'package:first_try/features/register/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(AuthRepository()),
        child: RegisterViewBody(),
      ),
    );
  }
}
