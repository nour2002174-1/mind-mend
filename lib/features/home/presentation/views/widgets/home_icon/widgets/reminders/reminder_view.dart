
import 'package:first_try/constants.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/reminders/action_button.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/reminders/reminder_tile.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/widgets/reminders/set_reminderscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RemindersScreen extends StatefulWidget {
  static const String routeName = "RemindersScreen";
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  
  final RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final navModel = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                "Reminders",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: kPrimaryColor,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                onRefresh: _onRefresh,
                header: CustomHeader(
                  builder: (context, mode) {
                    return Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: 60,
                        width: 60,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/timer_icon.png', 
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                child: ListView(
                  children: [
                    ReminderTile(
                      time: "08:00 AM",
                      title: "Drug",
                      subtitle: "Friday, Sunday",
                      initialActiveState: false,
                    ),
                    ReminderTile(
                      time: "08:00 AM",
                      title: "Therapist",
                      subtitle: "EveryDay",
                      initialActiveState: true,
                    ),
                    ReminderTile(
                      time: "08:00 AM",
                      title: "Session with Dr.",
                      subtitle: "24-Sep-2025",
                      initialActiveState: true,
                    ),
                    ReminderTile(
                      time: "08:00 AM",
                      title: "Session with Dr.",
                      subtitle: "Saturday",
                      initialActiveState: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
          ],
        ),
      ),
      floatingActionButton:
       
           ClipOval(
             child: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Image.asset(AssetsData.add_icon),
              onPressed:  (){
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SetReminderScreen()),
                  );
                      
                   }),
           ),
         
        bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
      ),
    );
  }
}
