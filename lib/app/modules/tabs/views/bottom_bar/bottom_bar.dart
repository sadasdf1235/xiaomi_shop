import 'package:flutter/material.dart';
class BottomBar extends BottomNavigationBarItem{
  BottomBar({required String title,required Icon icon,required Icon iconActive}):super(
      label: title,
      icon: icon,
      activeIcon: iconActive
  );
}