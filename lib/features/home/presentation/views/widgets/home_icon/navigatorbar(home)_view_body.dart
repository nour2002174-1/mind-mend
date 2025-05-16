import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/12_steps_problem/12stepproblem_firstpage.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/Notfications/Notification_listviewscreen.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/Notfications/notifactions_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/Notfications/notifactions_view_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/library/library.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/podcasts/podcasts.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/reminders/reminder_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/voicecall/voicecall_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/write_feelings_ison/choose_feelings.dart';
import 'package:first_try/features/login/presentation/views/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBar_Home extends StatefulWidget {
  @override
  State<NavigatorBar_Home> createState() => _NavigatorBar_HomeState();
}

class _NavigatorBar_HomeState extends State<NavigatorBar_Home> {
  String firstName = ''; 
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    fetchFirstName(); 
  }

 Future<void> fetchFirstName() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users_collection')
        .doc(user.uid)
        .get();

    setState(() {
      // Check if doc exists and has 'firstName'
      firstName = doc.exists ? doc.get('firstName') ?? 'User' : 'User';
      isLoading = false;
    });
  } catch (e) {
    print('Error fetching first name: $e');
    setState(() {
      firstName = 'User'; // Fallback
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: ClipOval(
            child: Image.asset(
              AssetsData.Floating_action_button_home_icon,
              height: 20,
              width: 19,
            ),
          ),
          onPressed: () {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChooseFeelings_View()),
            );
          },
        ),
      ),
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
              MaterialPageRoute(builder: (context) => Notification_listviewscreen()),
            );
                  },
                  icon: Image.asset(
                    AssetsData.custom_app_bar_alarm,
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBox(width: 9),
                IconButton(
                  onPressed: () {
  Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => VoiceCall_view()),
            );

                  },
                  icon: Image.asset(
                    AssetsData.custom_app_bar_messages,
                    width: 30,
                    height: 30,
                  ),
                ),
                Spacer(),
                Text(
                  'MindMend',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                     Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login_View()),
            );
                  },
                  icon: Image.asset(
                    AssetsData.custom_app_bar_login,
                    width: 75,
                    height: 75,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: kPrimaryColor)) // Show loading
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Welcome $firstName',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'A new day for more stable mental health',
                          style: GoogleFonts.arOneSans(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: 0.8,
                            color: Color(0xFF457B9D),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap:(){
                           Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => stepproblemfirstscreen_view()),
            );
                        
                        } 
                        ,
                        
                        child: Container(
                          
                          width: 366,
                          height: 174,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff70C1B3), Color(0xffFFFFFF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(width: 2, color: Color(0xff70C1B3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 6,bottom: 6),
                                child: Text('12 Steps problem',style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
                                  fontSize: 27,
                                ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 6,bottom: 0),
                                child: Text('Click here to start your',style: GoogleFonts.inter(
                                  color: Color.fromARGB(69, 123, 157, 1),
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  fontSize: 22,
                                ),
                                ),
                              ),
                               SizedBox(height: 5,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 12.0,top: 0),
                                 child: Text('journey.',style: GoogleFonts.inter(
                                    color: Color.fromARGB(69, 123, 157, 1),
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0,
                                    fontSize: 22,
                                  ),
                                  ),
                               ),
                              
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      buildNavButton(
                        icon: AssetsData.Navigator_bar_home_icon_library_icon,
                        label: 'Library', onTap: () { 
                          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LibraryScreen()),
            );
                         },
                      ),
                      SizedBox(height: 10),
                      buildNavButton(
                        icon: AssetsData.Navigator_bar_home_icon_podcast_icon,
                        label: 'Podcasts', onTap: () { 
                          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PodCastScreen()),
            );
                         },
                      ),
                      SizedBox(height: 10),
                      buildNavButton(
                        icon: AssetsData.Navigator_bar_Home_icon_oldsessions_icon,
                        label: 'Old Sessions', onTap: () {  },
                      ),
                      SizedBox(height: 10),
                      buildNavButton(
                        icon: AssetsData.Navigator_bar_home_icon_reminaders,
                        label: 'Reminders', onTap: () { 
                           Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RemindersScreen()),
            );
                         },
                        
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
  Widget buildNavButton({
  required String icon,
  required String label,
  required VoidCallback onTap,
}) {
  return Container(
    height: 72,
    width: 366,
    decoration: BoxDecoration(
      color: Color(0xffFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          offset: Offset(0, 5),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: onTap,
                icon: Image.asset(icon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
