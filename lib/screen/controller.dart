import 'package:flutter/material.dart';
import 'package:homesync/pages/graph.dart';
import 'package:homesync/pages/home_screen.dart';

import 'package:homesync/screen/add_device/add_device_main.dart';
import 'package:homesync/screen/homepage/add_device_main.dart';
import 'package:homesync/screen/room/bathroom_main.dart';
import 'package:homesync/screen/room/bedroom_main.dart';
import 'package:homesync/screen/room/hall_main.dart';
import 'package:homesync/screen/room/kitchen_main.dart';
import 'package:homesync/theme/homesync_appbar.dart';
import 'package:homesync/theme/homesync_theme.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    const HomePage(),
    const AddDeviceMain(),
    EnergyAnalysisScreen()
    // KitchenMain()
    // HallMain()
    // BedroomMain()

    // SearchPage(),
    // DashboardPage(),
    // ProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeSyncAppBar(
          title: 'HomeSync',
          height: MediaQuery.of(context).size.height / 13,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: homeSyncTheme.primaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 255, 178, 103),
          onTap: _onItemTap,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
