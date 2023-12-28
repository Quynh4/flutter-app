

// bottomNavigationBar

import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../screens/profile_screen.dart';
import 'icon_badge.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 7.0),
          GestureDetector(
            child: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
          GestureDetector(
            child: Icon(Icons.favorite),
          ),
          GestureDetector(
            child: Icon(Icons.mode_comment),
          ),
          GestureDetector(
            child: Icon(Icons.person),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
      SizedBox(width: 7.0),
      ],
    );
  }
  }