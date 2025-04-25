import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/features/verfication/presentation/views/widgets/otpfieldstyle.dart';
import 'package:flutter/material.dart';

class OtpViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController text1 = TextEditingController();
    TextEditingController text2 = TextEditingController();
    TextEditingController text3 = TextEditingController();
    TextEditingController text4 = TextEditingController();
    
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
          'sent to +234 706 067 2335',
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
        Elevatedbuttons.blue_elevatedbutton(text: 'verify', onPressed: (){})
      ],
    );
  }
}

