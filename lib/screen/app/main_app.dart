import 'package:chekin/screen/app/dashboard/views/dashboard.dart';
import 'package:chekin/screen/app/global/views/global.dart';
import 'package:chekin/screen/app/settings/views/settings.dart';
import 'package:chekin/screen/app/user/views/user.dart';
import 'package:chekin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; //New

  static const List<Widget> _pages = <Widget>[
    Dashboard(),
    Global(),
    UserScreen(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: klightPrimaryColor,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(
                    Feather.home,
                    size: 25,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Feather.home,
                    size: 25,
                    color: kBlackColor,
                  ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(
                    Octicons.globe,
                    size: 25,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Octicons.globe,
                    size: 25,
                    color: kBlackColor,
                  ),
            label: 'Global',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(
                    Feather.user,
                    size: 25,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Feather.user,
                    size: 25,
                    color: kBlackColor,
                  ),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? const Icon(
                    Feather.settings,
                    size: 25,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Feather.settings,
                    size: 25,
                    color: kBlackColor,
                  ),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
