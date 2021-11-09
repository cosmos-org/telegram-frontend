import 'package:flutter/material.dart';

import '../constants.dart';

class NavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.90),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      // onTap: (value) {
      //   // Respond to item press.
      // },
      items: [
        BottomNavigationBarItem(
          title: Text('Home Page'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text('Message'),
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}


