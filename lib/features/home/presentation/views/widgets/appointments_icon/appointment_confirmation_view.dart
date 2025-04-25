import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Appointment_confirmation_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, 
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
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavExample()),
                    );
                  }, 
                  icon: Icon(Icons.arrow_back)
                ),
                SizedBox(width: 100,),
                Text('Appointment',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0,
                    color: kPrimaryColor
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Appointment_Confirmation_View_body(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}

class Appointment_Confirmation_View_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Stack(
              children: [
               Image.asset(AssetsData.Confirmed_icon,height: 75,width: 75,),
               Container(
                width: 365,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xffFFD166)
                ),
               ),
               Positioned(
                top: -37.5, 
                left: (365 / 2) - (75 / 2),
                child: Image.asset(AssetsData.Confirmed_icon,width: 75,height: 75,)
               )
               
              ],
            ),
        ),
      ],
    );
  }
}