import 'dart:async';
import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/login/presentation/views/login.dart';
import 'package:flutter/material.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({Key? key}) : super(key: key);

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Login_View()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsData.splach_screen_image,
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
