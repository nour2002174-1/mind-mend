import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/write_feelings_ison/choose_feelings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WriteFeelingsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Feelings",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 4,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
      body: WriteFeelingsView_body(),
      );
    
  }
}


class WriteFeelingsView_body extends StatelessWidget{ 
@override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topCenter,
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
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(AssetsData.feelings_picture),
                    ),
                  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black87,
                                ),
                                children: [
                  TextSpan(text: 'Your Can write the situations you went through'),
                  TextSpan(
                    text: 'and the feelings you felt.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                                ],
                              ),),
                ),
                SizedBox(height: 15,),
                
                ElevatedButton(
                  
                  onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ChooseFeelings_View()),
                      );
                  },
                   child: Text('Try it now',
                   style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: kPrimaryColor
                    
                    )
                   ),
                   style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                    backgroundColor: Colors.white,
                    
                    ),
                   
                   ),
                     
            ])
          ),
        ),
      );
    
    
  }
}