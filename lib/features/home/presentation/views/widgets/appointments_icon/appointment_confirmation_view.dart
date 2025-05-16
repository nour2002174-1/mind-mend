import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/edit_appointment.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentConfirmationView extends StatelessWidget {
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
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 100),
                Text(
                  'Appointment',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: AppointmentConfirmationViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}

class AppointmentConfirmationViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 90),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(top: 80, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffFFD166),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Your appointment with '),
                            TextSpan(
                              text: 'Dr. Mahmoud',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' has been confirmed.'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    /*  Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            ),
                            onPressed: () {

                               Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Edit_appointment()),
                      );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Edit',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Image.asset(
                                  AssetsData.pen_icon,
                                  height: 16,
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 23.83,
                           //idth:  111.83,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white
                            ),
                      
                          )
                        ],
                      ),*/
                      Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                           Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Edit_appointment()),
                      );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Edit',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              AssetsData.pen_icon,
                              width: 15,
                              height: 15,
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                    ]
                  ),
                ),
                Positioned(
                  top: -40,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      AssetsData.Confirmed_icon,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(top: 80, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffF0E5CF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                         decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    boxShadow: [
                     BoxShadow(
                     color: Colors.black.withOpacity(0.08),
                      offset: Offset(0, 4),
                     blurRadius: 44,
                       spreadRadius: 0,
                       ),
                       ],
                       borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          
                          text: TextSpan( 
                            children: [
                               TextSpan(
                                text: 'Dr Mahmoud ',style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14)),
                                 TextSpan(
                                text: 'will confirm the appointment soon.',style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14)),
                                            ]
                                            ) ,
                        ),
                      ),

                      ),
                                 Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Edit',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              AssetsData.pen_icon,
                              width: 15,
                              height: 15,
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                ),
                Positioned(
                  top: -40,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      AssetsData.loading_icon,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
