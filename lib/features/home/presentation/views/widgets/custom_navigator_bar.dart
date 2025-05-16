import 'package:first_try/features/home/presentation/views/Custom_Nav_bar.dart';
import 'package:first_try/features/home/presentation/views/widgets/Notes_icon/notes_icon_view.dart';
import 'package:first_try/features/home/presentation/views/widgets/appointments_icon/Navigatorbar(appointment)_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/home_icon/navigatorbar(home)_view_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/settings_icon/navigatorbar(seetings)_view_body.dart';
import 'package:first_try/features/home/presentation/views/widgets/write_feelings_ison/write_feelings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_viewmodel.dart';
import 'custom_navigator_bar.dart';


class BottomNavExample extends StatelessWidget {
  final List<Widget> _pages = [
    
Navigatorbar_seetings(),
    Navigatorbar_appointments(),
    NavigatorBar_Home(),
    Notesicon_View(),
    WriteFeelingsView()
  ];

  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<BottomNavViewModel>(context);

    return Scaffold(
      body: _pages[navModel.currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navModel.currentIndex,
        onTap: navModel.changeIndex,
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

