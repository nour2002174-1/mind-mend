import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/verfication/presentation/views/OTP_view.dart';
import 'package:flutter/material.dart';

class PhoneNumberPageBody extends StatefulWidget {
  @override
  State<PhoneNumberPageBody> createState() => _PhoneNumberPageBodyState();
}

class _PhoneNumberPageBodyState extends State<PhoneNumberPageBody> {
  final TextEditingController phoneController = TextEditingController();
  String? verificationId;

  // Function to send OTP
  Future<void> sendOtp() async {
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }

    // Ensure phone number starts with the Egyptian country code
    if (!phoneNumber.startsWith('+20')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Phone number must start with +20 for Egypt')),
      );
      return;
    }

    // Send OTP using Firebase Authentication
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-verification completed
        await FirebaseAuth.instance.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone number verified automatically')),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print('Verification failed: ${e.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed. Please try again')),
        );
       
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verification ID and navigate to the OTP view
        setState(() {
          this.verificationId = verificationId;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpView(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
        setState(() {
          this.verificationId = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.photo_in_phonenumber_screen_and_verfication_code),
          Center(
            child: Text(
              'Enter Your Phone Number',
              style: TextStyle(
                color: Color(0xff457B9D),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: 366,
              height: 64,
              child: Textfields.loginTextField(
                hint: 'Phone Number',
                controller: phoneController,
                isPassword: false,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'We will send you an SMS message to confirm the ',
              style: TextStyle(
                color: Color(0xffB0B0B0),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Center(
            child: Text(
              'phone number',
              style: TextStyle(
                color: Color(0xffB0B0B0),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 45),
          Center(
            child: SizedBox(
              width: 150,
              height: 50,
              child: Elevatedbuttons.blue_elevatedbutton(
                text: 'Get OTP',
                onPressed: () {
                  sendOtp();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
