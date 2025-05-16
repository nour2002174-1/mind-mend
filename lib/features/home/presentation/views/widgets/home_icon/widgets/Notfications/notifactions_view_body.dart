import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/settings_icon/navigatorbar(seetings)_view_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications_view_body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Padding(
            padding: const EdgeInsets.all(7.0),
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
                        child: Image.asset(AssetsData.notifications_icon),
                      ),
                    
                    ),
                  ),
                  Center(
                    child: Text('No Notifications yet',
                    style: GoogleFonts.dmSans(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
                  ),
                    Center(
                      child: Text('Please turn on notifications from settings to ',
                                      style: GoogleFonts.dmSans(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    ),
                  Center(
                    child: Text('receive all new updates',
                    style: GoogleFonts.dmSans(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                         Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Navigatorbar_seetings()),
              );
                    
                       
                      },
                       child: Text('Go To Settings',
                       style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 12,color: kPrimaryColor)
                       ),
                       style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white,
                        
                        ),
                       
                       ),
                  ),
                       
              ])
            ),
          ),
    );
  }
}