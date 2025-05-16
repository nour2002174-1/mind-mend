  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:first_try/constants.dart';
  import 'package:first_try/core/utils/assets.dart';
  import 'package:first_try/core/utils/textfields.dart';
  import 'package:first_try/features/login/presentation/views/login.dart';
  import 'package:first_try/features/verfication/presentation/views/phone_number_page.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:google_sign_in/google_sign_in.dart';

  class RegisterViewBody extends StatefulWidget {
    @override
    _RegisterViewBodyState createState() => _RegisterViewBodyState();
  }

  class _RegisterViewBodyState extends State<RegisterViewBody> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController birthDateController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    bool isLoading = false;

    String? validateEmail(String? value) {
      final pattern = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$";
      final regex = RegExp(pattern);
      return value == null || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) return 'Please enter a password';
      if (value.length < 8) return 'Password must be at least 8 characters';
      if (!RegExp(r'[A-Z]').hasMatch(value))
        return 'Add at least one uppercase letter';
      if (!RegExp(r'[a-z]').hasMatch(value))
        return 'Add at least one lowercase letter';
      if (!RegExp(r'[0-9]').hasMatch(value)) return 'Add at least one number';
      if (!RegExp(r'[!@#\\$&*~]').hasMatch(value))
        return 'Add at least one special character (!@#\$&*~)';
      return null;
    }

    Future<void> registerUser() async {
      if (!_formKey.currentState!.validate()) return;
      setState(() => isLoading = true);

      try {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users_collection')
            .doc(userCredential.user!.uid)
            .set({
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
          'gender': genderController.text.trim(),
          'birthDate': birthDateController.text.trim(),
          'email': email,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Registration successful! Redirecting...'),
              duration: Duration(seconds: 2)),
        );

        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => PhoneNumberPage()));
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Registration failed')));
      } finally {
        if (mounted) setState(() => isLoading = false);
      }
    }

    final GoogleSignIn _googleSignIn = GoogleSignIn();

   Future<void> googleSignIn() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth = 
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = 
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Save user data to Firestore (merge to avoid overwrites)
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('users_collection')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': googleUser.displayName?.split(' ').first ?? 'User',
        'lastName': googleUser.displayName?.split(' ').last ?? '',
        'email': googleUser.email,
        'createdAt': FieldValue.serverTimestamp(), // Optional
      }, SetOptions(merge: true)); // Merge if doc exists
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => PhoneNumberPage()),
    );
  } catch (e) {
    print('Google sign-in error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign-in failed: $e')),
    );
  }
}
    Future<void> facebookSignIn() async {
      try {
        final LoginResult result = await FacebookAuth.instance.login();

        if (result.status == LoginStatus.success && result.accessToken != null) {
          final accessToken = result.accessToken;

          final facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken!.tokenString);

          await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Facebook Sign-In successful')),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PhoneNumberPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Facebook sign-in failed: ${result.message}')),
          );
        }
      } catch (e) {
        print('Facebook Sign-In Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }

    void _selectBirthDate(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        birthDateController.text =
            "\${pickedDate.day}/\${pickedDate.month}/\${pickedDate.year}";
      }
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildSocialButton(
                  icon: Icons.facebook,
                  text: 'Sign Up with Facebook',
                  color: Color(0xff1877F2),
                  onPressed: facebookSignIn,
                ),
                buildSocialButton(
                  iconData: FontAwesomeIcons.google,
                  text: 'Sign Up with Google',
                  color: Colors.red,
                  onPressed: googleSignIn,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('Create Account',
                      style: TextStyle(
                          color: Color(0xff457B9D),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: buildInputField(
                            hint: 'First Name',
                            controller: firstNameController,
                            validator: (value) => value == null || value.isEmpty
                                ? "Enter first name"
                                : null)),
                    const SizedBox(width: 8),
                    Expanded(
                        child: buildInputField(
                            hint: 'Last Name',
                            controller: lastNameController,
                            validator: (value) => value == null || value.isEmpty
                                ? "Enter last name"
                                : null)),
                  ],
                ),
                const SizedBox(height: 15),
                buildInputField(hint: 'Gender', controller: genderController),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => _selectBirthDate(context),
                  child: AbsorbPointer(
                    child: buildInputField(
                      hint: 'Birth Date',
                      controller: birthDateController,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AssetsData.calender_icon,
                            height: 20, width: 20),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? "Select your birth date"
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                buildInputField(
                    hint: 'Enter Your Email',
                    controller: emailController,
                    validator: validateEmail),
                const SizedBox(height: 15),
                buildInputField(
                    hint: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    validator: validatePassword),
                const SizedBox(height: 15),
                buildInputField(
                  hint: 'Re-Enter Your Password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (value) => value == null
                      ? "Please re-enter your password"
                      : value != passwordController.text
                          ? "Passwords do not match"
                          : null,
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: isLoading ? null : registerUser,
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Register',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(color: Color(0xff4D4D4D), fontSize: 12)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Login_View()));
                      },
                      child: Text('Login now',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSocialButton({
      IconData? icon,
      IconData? iconData,
      required String text,
      required Color color,
      required VoidCallback onPressed,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: SizedBox(
          height: 64,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              side: BorderSide(color: Color(0xffE0E0E9)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon ?? iconData, color: color),
                const SizedBox(width: 8),
                Text(text,
                    style: const TextStyle(
                        color: Color(0xff1A1A1A),
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildInputField({
      required String hint,
      required TextEditingController controller,
      bool isPassword = false,
      Widget? suffixIcon,
      String? Function(String?)? validator,
    }) {
      return Textfields.loginTextField(
        hint: hint,
        controller: controller,
        isPassword: isPassword,
        suffixIcon: suffixIcon,
        validator: validator,
      );
    }
  }
