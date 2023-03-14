import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/sql_helper.dart';
import 'package:on_time_dining/model/Restaurant.dart';
import 'package:on_time_dining/page/restaurant_plats.dart';
import 'package:on_time_dining/service/restaurant_service.dart';
import 'package:on_time_dining/widget/restaurant_card.dart';

import '../widget/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantService restaurantService = RestaurantService();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: restaurantService.getAllRestaurants(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> restaurantMaps = snapshot.data!;
            List<Restaurant> restaurants =
                restaurantMaps.map((map) => Restaurant.fromMap(map)).toList();
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                //TODO this is a card of restaurant to refactoring
                return GestureDetector(
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(10.00),
                      margin: EdgeInsets.all(5.00),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "name: ${restaurants[index].name}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(" phone: ${restaurants[index].phone}",
                              style: TextStyle(color: Colors.white)),
                          Text(" city: ${restaurants[index].city}",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ]),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RestaurantPlats(
                              restaurant: restaurants[index],
                            )));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   RestaurantService restaurantService = RestaurantService();
//   List<Map> restaurantList = [];

//   // @override
//   // void initState() {
//   //   print("init state");
//   // }

//   HomePage({super.key}) {
//     restaurantService
//         .getAllRestaurants()
//         .then((value) => restaurantList = value);
//     print(restaurantList.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.arrow_back_outlined),
//         title: const Text("Restaurants"),
//         actions: const [
//           Icon(Icons.search),
//         ],
//         centerTitle: true,
//       ),
//       body: Column(children: []),
//       bottomNavigationBar: ButtomNavigationMenu(),
//     );
//   }

//   void _getAllRestaurants() async {
//     restaurantList = await restaurantService.getAllRestaurants();
//   }
// }

// // FutureBuilder(
// //       future: sqlHelper.getRestautants(),
// //       builder: (BuildContext context, AsyncSnapshot snapshot) {
// //         print(snapshot.data);
// //         return ListView.builder(
// //           itemCount: snapshot.data.length,
// //           itemBuilder: (context, index) {
// //             final restaurant = snapshot.data[index];
// //             return Card(
// //               child: Column(
// //                 children: <Widget>[
// //                   Expanded(
// //                     child: Container(
// //                       decoration: const BoxDecoration(
// //                         image: DecorationImage(
// //                           image: NetworkImage(
// //                               "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   ListTile(
// //                     title: Text(
// //                       restaurant.name,
// //                       textAlign: TextAlign.center,
// //                       style: const TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
