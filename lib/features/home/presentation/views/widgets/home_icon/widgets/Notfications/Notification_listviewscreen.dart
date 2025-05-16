import 'package:first_try/constants.dart';
import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Notification_listviewscreen extends StatefulWidget {
  
  @override
  State<Notification_listviewscreen> createState() => _Notification_listviewscreenState();
}


class _Notification_listviewscreenState extends State<Notification_listviewscreen> {
   List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'subtitle': 'Message from Docrot Mahmoud: hello!',
      'date': '22/12/2023',
      'time': '12:38 PM',
      'type': 'message',
    },
    {
      'title': 'Compleat your Steps',
      'subtitle': 'Assess the Situation',
      'date': '22/12/2023',
      'time': '11:22 PM',
      'type': 'task',
    },
    {
      'title': 'Reminder: Drug',
      'subtitle': 'Assess the Situation',
      'date': '22/12/2023',
      'time': '08:00 AM',
      'type': 'reminder',
    },
  ];

  void clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

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
              title: Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                         Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => BottomNavExample()),
                                );
                      },
                      icon: Icon(Icons.arrow_back, color: kPrimaryColor),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(onPressed: clearNotifications, 
                  child:
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('Empty',style: GoogleFonts.inter(color: kPrimaryColor,fontSize: 16,fontWeight: FontWeight.w300),)) ),
                  
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
      body: notifications.isEmpty
          ? Center(child: Text('No Notifications'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCard(notification: notification);
              },
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
    ));
  }
}
class NotificationCard extends StatelessWidget {
  final Map<String, String> notification;

  const NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    Color stripeColor;
    switch (notification['type']) {
      case 'message':
        stripeColor = Colors.red;
        break;
      case 'reminder':
        stripeColor = Colors.yellow;
        break;
      default:
        stripeColor = Colors.orange;
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Container(
          width: 5,
          height: double.infinity,
          color: stripeColor,
        ),
        title: Text(notification['title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['subtitle'] ?? ''),
            SizedBox(height: 4),
            Text('${notification['date']} ${notification['time']}',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
