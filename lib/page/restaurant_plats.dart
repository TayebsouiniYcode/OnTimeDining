import 'package:flutter/material.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';
import 'package:on_time_dining/widget/category.dart';
import 'package:on_time_dining/widget/dash_card.dart';
import 'package:on_time_dining/widget/dash_list.dart';
import 'package:on_time_dining/widget/popular_dash.dart';

import '../model/Restaurant.dart';

class RestaurantPlats extends StatelessWidget {
  late Restaurant _restaurant;
  RestaurantPlats({super.key, required Restaurant restaurant}) {
    _restaurant = restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onTap: () {
            //TODO previous page
          },
        ),
        title: Text(
          '${_restaurant.name}',
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
      body: SingleChildScrollView(
          child: Column(children: [
        Categories(),
        PopularDash(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(12),
          child: Row(
            // children: const [DashCard()],
            children: [
              DashCard(
                  title: "Burger",
                  description: "Taste our Hot Burger",
                  image: "burger.png",
                  price: "10"),
              DashCard(
                  title: "Burger",
                  description: "Taste our Hot Burger",
                  image: "dash1.jpg",
                  price: "10"),
              DashCard(
                  title: "Burger",
                  description: "Taste our Hot Burger",
                  image: "dash2.jpg",
                  price: "10"),
              DashCard(
                  title: "Burger",
                  description: "Taste our Hot Burger",
                  image: "dash3.jpg",
                  price: "10"),
              DashCard(
                  title: "Burger",
                  description: "Taste our Hot Burger",
                  image: "burger.png",
                  price: "10")
            ],
          ),
        ),
        DashList(),
      ])),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}
