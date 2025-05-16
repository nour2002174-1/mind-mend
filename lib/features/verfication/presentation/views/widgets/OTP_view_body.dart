import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/features/verfication/presentation/views/widgets/otpfieldstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpViewBody extends StatelessWidget {
  final String verificationId;

  OtpViewBody({required this.verificationId});

  @override
  Widget build(BuildContext context) {
    TextEditingController text1 = TextEditingController();
    TextEditingController text2 = TextEditingController();
    TextEditingController text3 = TextEditingController();
    TextEditingController text4 = TextEditingController();

    // Function to handle OTP verification
    Future<void> verifyOtp() async {
      String otp = text1.text + text2.text + text3.text + text4.text;

      if (otp.length == 4) {
        try {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: otp,
          );

          // Sign in with the credential
          await FirebaseAuth.instance.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP verified successfully')));

          // Navigate to the next screen after successful verification
          // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));

        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to verify OTP')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a valid OTP')));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: Image.asset(
              AssetsData.photo_in_phonenumber_screen_and_verfication_code,
              height: 150,
              width: 200,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Enter The OTP',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'sent to +20 706 067 2335',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpfield(context, text1),
              SizedBox(width: 15),
              otpfield(context, text2),
              SizedBox(width: 15),
              otpfield(context, text3),
              SizedBox(width: 15),
              otpfield(context, text4),
            ],
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't you receive the OTP? ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Resend OTP logic
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff457B9D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Elevatedbuttons.blue_elevatedbutton(
          text: 'Verify',
          onPressed: verifyOtp,  // Trigger the OTP verification function
        )
      ],
    );
  }
}
