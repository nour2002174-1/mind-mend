import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Secondstep extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavExample()),
                      );
                    },
                    icon: Icon(Icons.arrow_back,color: kPrimaryColor,),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'First Step',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 430,
          width: 360,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(16),
             color: Color(0xffF0E5CF),
        
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Acknowledge the Problem',style: GoogleFonts.dmSans(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w900))
           , Text('The first step is to accept that there'
           ,style: GoogleFonts.dmSans(color:kPrimaryColor
            ,fontSize:16,fontWeight: FontWeight.w500))
            , Text('is an issue affecting your life and that'
           ,style: GoogleFonts.dmSans(color:kPrimaryColor
            ,fontSize:16,fontWeight: FontWeight.w500))
            , Text('is an issue affecting your life and that'
           ,style: GoogleFonts.dmSans(color:kPrimaryColor
            ,fontSize:16,fontWeight: FontWeight.w500))
           , Text('well-being.'
           ,style: GoogleFonts.dmSans(color:kPrimaryColor
            ,fontSize:16,fontWeight: FontWeight.w500))
           
            ],
          )
        ),
      ),
    ),
    );
    
    

  }
}