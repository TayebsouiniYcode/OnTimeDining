import 'package:flutter/material.dart';

class ButtomNavigationMenu extends StatefulWidget {
  const ButtomNavigationMenu({super.key});

  @override
  State<ButtomNavigationMenu> createState() => _ButtomNavigationMenu();
}

class _ButtomNavigationMenu extends State<ButtomNavigationMenu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Panier',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profil',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store_outlined),
          label: 'Panier',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
