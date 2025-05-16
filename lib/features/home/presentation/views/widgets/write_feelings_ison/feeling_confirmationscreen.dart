import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/write_feelings_ison/choose_feelings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeelingsConfirmationScreen extends StatefulWidget {
  final List<String> selectedFeelings;

  const FeelingsConfirmationScreen({required this.selectedFeelings, Key? key}) : super(key: key);

  @override
  _FeelingsConfirmationScreenState createState() => _FeelingsConfirmationScreenState();
}

class _FeelingsConfirmationScreenState extends State<FeelingsConfirmationScreen> {
  TextEditingController textarea = TextEditingController();
  List<String> savedTexts = [];

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
                  'Feelings',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'You Feel',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.selectedFeelings.map((feeling) {
                final bgColor = feelingBgColors[feeling] ?? Colors.grey[200]!;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    feeling,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'What made you feel that way?',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Textfields.loginTextField(
              hint: '',
              controller: textarea,
              maxLines: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            if (textarea.text.isNotEmpty) {
              savedTexts.add(textarea.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedFeelingsScreen(
                    savedTexts: savedTexts,
                    selectedFeelings: widget.selectedFeelings,
                  ),
                ),
              );
            }
          },
          child: Image.asset(AssetsData.confirmation_icon, height: 15, width: 15),
          backgroundColor: kPrimaryColor,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}

// -------------------- SAVED FEELINGS SCREEN ---------------------

class SavedFeelingsScreen extends StatelessWidget {
  final List<String> savedTexts;
  final List<String> selectedFeelings;

  const SavedFeelingsScreen({
    required this.savedTexts,
    required this.selectedFeelings,
    Key? key,
  }) : super(key: key);

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
            child:Stack(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
               // SizedBox(width: 135),
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
               Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Feelings',
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
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: savedTexts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                  color: Colors.grey,
                  width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:  Color.fromRGBO(255,255,255,0.1) 
                       //ffset: Offset(0, 4),
                        //urRadius: 44,
                        //readRadius: 0,
                      ),
                    
                    ],
                  ),
                  
                  child: Text(
                    'You were feeling',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: selectedFeelings.map((feeling) {
                      final bgColor = feelingBgColors[feeling] ?? Colors.grey[200]!;
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          feeling,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    savedTexts[index],
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
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
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Edit',
                              style: GoogleFonts.inter(
                                color: kPrimaryColor,
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
        },
      ),
     floatingActionButton: ClipOval(
       child: FloatingActionButton(
        
        onPressed: (){
           Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChooseFeelings_View()),
            );
        },
        backgroundColor: kPrimaryColor,
       child: Image.asset(AssetsData.add_note_image,height: 20,width: 20,),
       
       
       ),
     ),
        
        
        );
    
  }
}
