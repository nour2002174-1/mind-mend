import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/Notes_icon/Note_View.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notesicon_View extends StatelessWidget{
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
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                    'Mediacl Advice',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: kPrimaryColor,
                    ),
                  ),
            ),
              
          ),
        ),
      ),
      body: Notesicon_View_body(),
    );
    
    

  }
}
class Notesicon_View_body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 16,left: 10,top: 10,right: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(240, 229, 207, 1.0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 17.94,
                  width: 337,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    boxShadow: [
      BoxShadow(
        color: const Color.fromRGBO(0, 0, 0, 0.08),
        offset: const Offset(0, 4),
        blurRadius: 44, 
        spreadRadius: 0, 
      ),
    ],
                  ),
                  child: RichText(
                  text: TextSpan(
                  children: [
                  TextSpan(
                  text: 'Session 1 ',
                  style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(
        text: 'with Doctor Mahmoud',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
        ),
      ),
    ],
  ),
)

                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black,
                    ),
                    Text('Take Sertraline 50mgo nce daily in the morning.',
                    style: GoogleFonts.dmSans(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
                SizedBox(height: 2,),
                 Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black,
                    ),
                    Text('Take Sertraline 50mgo nce daily in the morning.',
                    style: GoogleFonts.dmSans(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
                 SizedBox(height: 2,),
                 Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black,
                    ),
                    Text('Take Sertraline 50mgo nce daily in the morning.',
                    style: GoogleFonts.dmSans(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
                 SizedBox(height: 2,),
                 Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 2,
                      color: Colors.black,
                    ),
                    Text('Take Sertraline 50mgo nce daily in the morning.',
                    style: GoogleFonts.dmSans(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                    ),)
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                         
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Note_View()),
      );
                        },
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View more',
                                style: GoogleFonts.inter(
                                  color: kPrimaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                             SizedBox(width: 2),
                              Image.asset(
                                AssetsData.three_dots_icon,
                                width: 26,
                                height: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFFD166),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1pm to 2pm',
                              style: GoogleFonts.inter(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Image.asset(
                              AssetsData.clock_icon,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFFD166),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '23/11/2025',
                              style: GoogleFonts.inter(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Image.asset(
                              AssetsData.calender_icon,
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}