// import 'dart:async';
import 'package:demo/pages/heatmap.dart';
import 'package:demo/pages/settings.dart';
import 'package:demo/pages/timers_page.dart';
import 'package:demo/utils/colors_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //navigate the navbar
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HeatMap(),
    TimeTracker(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("#CCEAEB"),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // color: hexStringToColor("#0B666A"),
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Track Time'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
