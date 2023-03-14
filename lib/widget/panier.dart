import 'package:flutter/material.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';

class Panier extends StatefulWidget {
  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}
