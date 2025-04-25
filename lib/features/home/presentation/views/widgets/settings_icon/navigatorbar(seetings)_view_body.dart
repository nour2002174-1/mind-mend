import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/home_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/navigatorbar(home)_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigatorbar_seetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:PreferredSize(
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
                IconButton(onPressed: (){Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavExample()),
      );

                }, icon: Icon(Icons.arrow_back)),
                SizedBox(width: 100,),
                Text('Your Profile',
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
    body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           
            children: [
              Container(
                width: 365,
                height: 100,
                decoration: BoxDecoration(
                color: kPrimaryColor, 
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    offset: Offset(0, 4),
                    blurRadius:44,
                    spreadRadius: 0,
                  ),
                ],
              ),
              ),
              SizedBox(height: 12,),
              Container(
                height: 350,
                width: 365,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                offset: Offset(0, 4),
                blurRadius: 44,
                spreadRadius: 0,
              ),
            ],
          ),),
          SizedBox(height: 12,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('More',style: GoogleFonts.inter(color: kPrimaryColor,fontWeight: FontWeight.w600,fontSize: 14),),
            )),
            SizedBox(height: 12,),
            Container(
                height: 139,
                width: 363,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                offset: Offset(0, 4),
                blurRadius: 44,
                spreadRadius: 0,
              ),
            ],
          ),),
            ],
          ),
        ),
      ),
    ),
    );
    

  }
}