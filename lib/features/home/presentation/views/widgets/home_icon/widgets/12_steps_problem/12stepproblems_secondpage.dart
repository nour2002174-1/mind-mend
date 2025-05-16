import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/core/utils/elevatedbuttons.dart';
import 'package:first_try/core/utils/textfields.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/12_steps_problem/Firststep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class stepproblem_secondscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);
    TextEditingController problemcontroller = TextEditingController();
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
body: Padding(
  padding: const EdgeInsets.all(12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(17),
        child: Image.asset(AssetsData.secondphotostepsproblem,height: 269.74,width: 257.17),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Textfields.loginTextField(hint: 'What is your problem?'
        ,controller: problemcontroller),
      )  ,
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Elevatedbuttons.blue_elevatedbutton(text: 'complete'
        , onPressed: (){
           
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>firststep()));
        }),
      )
    ],
  ),
),
 
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),

     );
  }
}