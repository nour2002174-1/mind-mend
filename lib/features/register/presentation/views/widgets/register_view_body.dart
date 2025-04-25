import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/login/presentation/views/login.dart';
import 'package:first_try/features/register/presentation/bloc/auth/auth_cubit.dart';
import 'package:first_try/features/register/presentation/bloc/auth/auth_state.dart';
import 'package:first_try/features/verfication/presentation/views/phone_number_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/textfields.dart';

class RegisterViewBody extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _selectBirthDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {
    birthDateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  }
}

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavExample()),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.erMessage)),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: BorderSide(color: Color(0xffE0E0E9)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, color: Color(0xff1877F2)),
                            SizedBox(width: 8),
                            Text(
                              'Sign Up with Facebook',
                              style: TextStyle(
                                color: Color(0xff1A1A1A),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Google button
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: BorderSide(color: Color(0xffE0E0E9)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Sign Up with Google',
                              style: TextStyle(
                                color: Color(0xff1A1A1A),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xff457B9D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Textfields.loginTextField(
                            hint: 'First Name',
                            controller: firstNameController,
                            isPassword: false,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Textfields.loginTextField(
                            hint: 'Last Name',
                            controller: lastNameController,
                            isPassword: false,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Textfields.loginTextField(
                    hint: 'Gender',
                    controller: genderController,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),

                  GestureDetector(
                  onTap: () => _selectBirthDate(context),
                   child: AbsorbPointer(
                   child: Textfields.loginTextField(
                  suffixIcon: Padding(
                    padding : EdgeInsets.all(8),
                    child: Image.asset(AssetsData.calender_icon,height: 20,width: 20,
                     
                    
                    ),
                    
                    ),
                    hint: 'Birth Date',
                   controller: birthDateController,
                   isPassword: false,
                            ),
  ),
),

                  SizedBox(height: 15),

                  Textfields.loginTextField(
                    hint: 'Enter Your Email',
                    controller: emailOrPhoneController,
                    isPassword: false,
                  ),
                  SizedBox(height: 15),

                  Textfields.loginTextField(
                    hint: 'Password',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 15),

                  Textfields.loginTextField(
                    hint: 'Re-Enter Your Password',
                    controller: confirmPasswordController,
                    isPassword: true,
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Elevatedbuttons.blue_elevatedbutton(
                        text: 'Register',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneNumberPage()),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style:
                            TextStyle(color: Color(0xff4D4D4D), fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_View()),
                          );
                        },
                        child: Text(
                          'Login now',
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
            ),
          ),
        );
      },
    );
  }
}
