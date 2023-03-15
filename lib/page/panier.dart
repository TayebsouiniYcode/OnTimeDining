import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/commandItemHelper.dart';
import 'package:on_time_dining/helpers/panier.dart';
import 'package:on_time_dining/service/commandItem_service.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';
import 'package:on_time_dining/widget/left_drawer.dart';

import '../model/Dash.dart';

class MyPanier extends StatefulWidget {
  const MyPanier({super.key});

  @override
  State<MyPanier> createState() => _MyPanierState();
}

class _MyPanierState extends State<MyPanier> {
  CommandItemService commandItemService = CommandItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPanier(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 127, 43, 43),
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onTap: () {
            //TODO previous page
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Panier',
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: ElevatedButton(
        child: Text("Checkout"),
        onPressed: () {
          commandItemService.insertCommandItem();
        },
      ),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}
