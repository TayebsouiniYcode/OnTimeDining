import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/sql_helper.dart';
import 'package:on_time_dining/model/Restaurant.dart';
import 'package:on_time_dining/widget/restaurant_card.dart';

import '../widget/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  //TODO delete this restaurant
  Restaurant restaurant = Restaurant(
      id: 23,
      name: 'YouFood',
      city: "Youssoufia",
      country: "Morocco",
      zipCode: "46300",
      image: "1.jpg",
      phone: "0607189671",
      createdAt: DateTime.now());

  SQLHelper helper = SQLHelper();
  List<Restaurant> restaurants = [];

  HomePage({super.key}) {
    _getAllRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text("Restaurants"),
        actions: const [
          Icon(Icons.search),
        ],
        centerTitle: true,
      ),
      body: Column(children: [
        RestaurantCard(restaurant: restaurant),
        RestaurantCard(restaurant: restaurant),
        RestaurantCard(restaurant: restaurant)
      ]),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }

  void _getAllRestaurant() {
    //TODO
    // helper.getRestautants().then((list) => restaurants = list);
  }
}



// FutureBuilder(
//       future: sqlHelper.getRestautants(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         print(snapshot.data);
//         return ListView.builder(
//           itemCount: snapshot.data.length,
//           itemBuilder: (context, index) {
//             final restaurant = snapshot.data[index];
//             return Card(
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text(
//                       restaurant.name,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );