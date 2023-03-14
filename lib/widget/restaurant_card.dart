import 'package:flutter/material.dart';
import 'package:on_time_dining/page/restaurant_plats.dart';

import '../model/Restaurant.dart';

class RestaurantCard extends StatelessWidget {
  late Restaurant _restaurant;

  RestaurantCard({super.key, required Restaurant restaurant}) {
    _restaurant = restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        RestaurantPlats(restaurant: _restaurant)));
              },
              child: const SizedBox(
                width: double.infinity,
                height: 160,
                child: Center(
                  child: Image(
                    image: AssetImage("images/3.jpg"),
                    fit: BoxFit.cover,
                    height: double.infinity, // set your height
                    width: double.infinity,
                  ),
                  // child: Text("Popular"),
                ),
              )),
        ),
      ),
    );
  }
}
