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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // 👈 Wrap to avoid overflow on small screens
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
                  if (phoneController.text.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OtpView()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter your phone number')),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
