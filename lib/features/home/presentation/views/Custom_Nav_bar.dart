import 'package:first_try/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
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
    );
  }
}