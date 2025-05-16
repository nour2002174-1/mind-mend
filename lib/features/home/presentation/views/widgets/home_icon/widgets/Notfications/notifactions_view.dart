import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/Notfications/notifactions_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Notifcations_views extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Stack(
               //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                       Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavExample()),
            );
                    },
                    icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Library",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
         
          ],
        ),
      ),
 bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
      body: Notifications_view_body(),
    );
  }
}























