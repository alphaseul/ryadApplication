import 'package:flutter/material.dart';

import 'package:ryadapplication/features/coach_sportif/presentation/pages/home_page.dart';
import 'package:ryadapplication/features/coach_sportif/presentation/pages/profil_page.dart';
import 'package:ryadapplication/features/coach_sportif/presentation/pages/videos_page.dart';

class NavbarBottom extends StatefulWidget {
  NavbarBottom({Key key}) : super(key: key);

  @override
  _NavbarBottom createState() => _NavbarBottom();
}

class _NavbarBottom extends State<NavbarBottom> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [Home(), Videos(), Profil()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow),
            label: 'Vidéos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
