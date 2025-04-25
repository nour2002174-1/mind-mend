import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';

class Home_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // AppBar background color
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                offset: Offset(0, 4),
                blurRadius: 44,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsData.custom_app_bar_alarm,
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 9),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsData.custom_app_bar_messages,
                    width: 30,
                    height: 30,
                  ),
                ),
                Spacer(),
                Text(
                  'MindMend',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsData.custom_app_bar_login,
                    width: 75,
                    height: 75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BottomNavExample(),
    );
  }
}
