import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBar_Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: ClipOval(child: Image.asset(AssetsData.Floating_action_button_home_icon,height: 20,width: 19,)),
        onPressed: () {},
      ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Welcome albaraa',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'A new day for more stable mental health',
                    style: GoogleFonts.arOneSans(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0.8,
                      color: Color(0xFF457B9D),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 366,
                  height: 174,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff70C1B3), Color(0xffFFFFFF)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 2, color: Color(0xff70C1B3)),
                  ),
                ),
                SizedBox(height: 15),
                buildNavButton(
                  icon: AssetsData.Navigator_bar_home_icon_library_icon,
                  label: 'Library',
                ),
                SizedBox(height: 10),
                buildNavButton(
                  icon: AssetsData.Navigator_bar_home_icon_podcast_icon,
                  label: 'Podcasts',
                ),
                SizedBox(height: 10),
                buildNavButton(
                  icon: AssetsData.Navigator_bar_Home_icon_oldsessions_icon,
                  label: 'Old Sessions',
                ),
                SizedBox(height: 10),
                buildNavButton(
                  icon: AssetsData.Navigator_bar_home_icon_reminaders,
                  label: 'Reminders',
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildNavButton({required String icon, required String label}) {
    return Container(
      height: 72,
      width: 366,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 5),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(icon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
