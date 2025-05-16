import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Note_View extends StatelessWidget{
   
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
  child: Stack(
    alignment: Alignment.center,
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
      Center(
        child: Text(
          'Medical Advice',
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
       bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
      body: Note_View_body(),
    );
  }
}
class Note_View_body extends StatelessWidget{
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
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
                      ),
                    ],
                  )

                ),
                
                Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                   SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                
                   SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        TextSpan(
                        text: '1.Take ',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sertraline 50mg',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             SizedBox(height: 2,),

                      Row(
                 
                  children: [
                    Icon(
                      Icons.circle,
                      size: 4,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2,),
                     Align(
                      alignment: Alignment.topLeft,
                       child: RichText(
                        text: TextSpan(
                        children: [
                        
                              TextSpan(
                                text: 'Additional note:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                        text: 'once daily in the morning after',
                        style: TextStyle(
                        color:Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                     ),
                
                   

                  ],),
                 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('breakfast. Stick to the prescribed dose and try not to ',style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('miss it. If you forget to take it, do so as soon as you',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('remember unless it’s close to the next dose.',style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                      ),
                
             
                
                

               
              ],
            ));
          
    
    
  }
}