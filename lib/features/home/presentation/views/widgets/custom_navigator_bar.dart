import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_viewmodel.dart';
import 'package:first_try/core/utils/assets.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/Navigatorbar(appointment)_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/navigatorbar(home)_view_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/settings_icon/navigatorbar(seetings)_view_body.dart';

class BottomNavExample extends StatelessWidget {
  final List<Widget> _pages = [
    Navigatorbar_seetings(),
    Navigatorbar_appointments(),
    NavigatorBar_Home(),
    NotesScreen(),
    FeelingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);

    return Scaffold(
      body: _pages[navModel.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xffF0E5CF),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AssetsData.Navigator_bar_settings_icon, width: 35, height: 35),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsData.Navigator_bar_appointments_icon, width: 35, height: 35),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsData.Navigator_bar_home_icon, width: 35, height: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsData.Navigator_bar_notes_icon, width: 35, height: 35),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsData.Navigator_bar_writefeelings_icon, width: 35, height: 35),
            label: 'Feelings',
          ),
        ],
      ),
    );
  }
}

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Notes Screen"));
  }
}

class FeelingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Feelings Screen"));
  }
}
