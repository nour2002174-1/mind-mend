import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/12_steps_problem/12stepproblems_secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class stepproblemfirstscreen_view extends StatelessWidget{
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
                    'lets start',
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
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 366,
             height: 600,
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
                           
                        
                       
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(AssetsData.firstphotostepsproblem),
                      ),
                    
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12,top: 6,bottom: 0),
                      child: Text('This app guides you through a proven',
                      style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12,top: 0,bottom: 2),
                      child: Text(' framework to:',
                                        style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 12,top: 0,bottom: 2),
                        child: Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,size: 6,),
                            Text('Acknowledge challenges,' ,style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 12,top: 0,bottom: 2),
                        child: Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,size: 6,),
                            Text('Understand their roots,' ,style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
                          ],),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 12,top: 0,bottom: 2),
                          child: Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,size: 6,),
                            Text('Take action, and' ,style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
                          ],),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left: 16,right: 12,top: 0,bottom: 2),
                          child: Row(
                          children: [
                            Icon(Icons.circle,color: Colors.black,size: 6,),
                            Text('Build a better future.' ,style: GoogleFonts.inter(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
                          ],),
                        ),
                        Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12,top: 6,bottom: 0),
                      child: Text('Each step is designed to help you grow and',
                      style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11,right: 12,top: 0,bottom: 0),
                      child: Text('create meaningful change. Progress, not',
                                        style: GoogleFonts.inter(color: Colors.black,fontWeight:FontWeight.w300,fontSize: 14))
                    ),
                       Padding(
                      padding: const EdgeInsets.only(left: 11,right: 12,top: 0,bottom: 0),
                      child: Text('perfection, is the goal.',
                                        style: GoogleFonts.inter(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 14))
                    ),

                  SizedBox(height: 20,),
                  Container(
                    width: 290,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>stepproblem_secondscreen()));
                      },
                       child: Text('Lets Begin',
                       style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 12,color: kPrimaryColor)
                       ),
                       style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        backgroundColor: Colors.white,
                        
                        ),
                       
                       ),
                  ),
                       
              ])
            ),
          ),
      ),
       
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}