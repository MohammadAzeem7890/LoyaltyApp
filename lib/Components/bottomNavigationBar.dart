import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

BottomNavigationBar bottomNavigationBar(int _selectedIndex, Function _onItemTapped) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('Assets/images/Home_Icon_Grey.png')),
        activeIcon: ImageIcon(AssetImage('Assets/images/Home_Icon_Blue.png')),
        title: Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('Assets/images/Locator_Icon_Grey.png')),
        activeIcon: ImageIcon(AssetImage('Assets/images/Locator_Icon_Blue.png')),
        title: Text('Locator'),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('Assets/images/Explore_Icon_Grey.png')),
        activeIcon: ImageIcon(AssetImage('Assets/images/Explore_Icon_Blue.png')),
        title: Text('Explore'),
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('Assets/images/Loyalty_Icon_Grey.png')),
        activeIcon: ImageIcon(AssetImage('Assets/images/Loyalty_Icon_Blue.png')),
        title: Text('Loyalty'),
      ),
    ],
    elevation: 10,
    currentIndex: _selectedIndex,
    selectedItemColor: appTheme.primaryColor,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.grey,
    onTap: _onItemTapped,
  );
}
