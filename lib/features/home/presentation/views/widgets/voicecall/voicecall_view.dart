import 'dart:ui';

import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VoiceCall_view extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
 
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                       IconButton(onPressed: (){
                         
                     Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavExample()));
                       }, icon: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        
                        ),child: Image.asset(AssetsData.back_arrow,height: 10,width: 10,),
                       )
                       ),

                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr. Mahmoud",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            Row(
                              children: [
                                Icon(Icons.fiber_manual_record,
                                    size: 12, color: Colors.red),
                                SizedBox(width: 4),
                                Text("REC 00:12:36",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

               
                Expanded(
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(Icons.person, size: 80, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),

            
            Positioned(
              bottom: 120,
              right: 16,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(Icons.person, color: Colors.blue),
                ),
              ),
            ),

            
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, -1),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    style:ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Color.fromRGBO(26, 26, 26, 0.2); 
      }
      return Color.fromRGBO(26, 26, 26, 0.5);
    }),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      CircleBorder(),
    ),
    ),
                    child: Center(child: Image.asset(AssetsData.volume_up_icon,height: 12,width: 21,))
                    ),

                    ElevatedButton(
                    onPressed: (){}, 
                    style:ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Color.fromRGBO(26, 26, 26, 0.2); 
      }
      return Color.fromRGBO(26, 26, 26, 0.5);
    }),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      CircleBorder(),
    ),
    ),
                    child: Center(child: Image.asset(AssetsData.video_call_icon,height: 12,width: 21,))
                    ),

                   IconButton(
                      onPressed: () {},
                    
                      icon: Container(
                        width: 50.88,
                        height: 50.57,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(236, 103, 70, 1)
                        ),
                        child: Image.asset(AssetsData.calling_icon,height: 8,width: 8,),
                      ),
                    ),
                   
                    ElevatedButton(
                    onPressed: (){}, 
                    style:ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Color.fromRGBO(26, 26, 26, 0.2); 
      }
      return Color.fromRGBO(26, 26, 26, 0.5);
    }),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      CircleBorder(),
    ),
    ),
                    child: Center(child: Image.asset(AssetsData.mic_icon,height: 12,width: 21,))
                    ),

                  
                    ElevatedButton(
                    onPressed: (){}, 
                    style:ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return Color.fromRGBO(26, 26, 26, 0.2); 
      }
      return Color.fromRGBO(26, 26, 26, 0.5);
    }),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      CircleBorder(),
    ),
    ),
                    child: Center(child: Image.asset(AssetsData.others_icon,height: 12,width: 21,))
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
     
    );
  }
}
