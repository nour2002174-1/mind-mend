import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/first_appointment_reservation_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigatorbar_appointments extends StatelessWidget{
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
            
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 135,),
                Align(
                  alignment: Alignment.center,
                  child: Text('Appointment',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 0,
                      color: kPrimaryColor
                      ),
                      ),
                ),
                    
             
              ],
            ),
          ),
        ),
      ),
      body:  Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 366,
              height: 500,
              decoration:   BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffF0E5CF)
                
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 290,
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                           //color: Color(0xffF0E5CF),
                        
                       
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(AssetsData.appointments_icon_man_picture),
                      ),
                    
                    ),
                  ),
                  Text('Your appointment with a psychiatrist is',
                  style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    Text('now online',
                  style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      
        
                      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  first_appointments_reservation_view()),
        );
                    },
                     child: Text('Book Yor appointment now',
                     style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 12,color: Colors.black)
                     ),
                     style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.white,
                      
                      ),
                     
                     ),
                       
              ])
            ),
          ),
      ),
      
    );

  }
}
