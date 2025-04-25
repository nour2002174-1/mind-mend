import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/login/presentation/bloc/auth/auth_login_cubit.dart';
import 'package:first_try/features/login/presentation/bloc/auth/auth_login_state.dart';
import 'package:first_try/features/register/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatefulWidget {
  @override
  _LoginViewBodyState createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthLoginCubit_login, AuthLoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          emailController.clear();
          passwordController.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavExample()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsData.image_in_login,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to',
                style: GoogleFonts.dmSans(
                  color: kPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Your Safe',
                style: GoogleFonts.dmSans(
                  color: kPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Environment',
                style: GoogleFonts.dmSans(
                  color: kPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 40),
              Textfields.loginTextField(
                controller: emailController,
                hint: 'Enter Your Email',
              ),
              const SizedBox(height: 12),
              Textfields.loginTextField(
                controller: passwordController,
                hint: 'Enter Your Password',
                isPassword: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: state is LoginLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 50,
                        width: 180,
                        child: Elevatedbuttons.blue_elevatedbutton(
                          text: 'Login',
                          onPressed: () {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please enter email & password'),
                                ),
                              );
                            } else {
                              BlocProvider.of<AuthLoginCubit_login>(context).login(
                                email,
                                password,
                              );
                            }
                          },
                        ),
                      ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(fontSize: 12, color: Color(0xff4D4D4D)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterView(),
                        ),
                      );
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
