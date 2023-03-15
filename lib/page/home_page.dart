import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_time_dining/model/Restaurant.dart';
import 'package:on_time_dining/page/restaurant_plats.dart';
import 'package:on_time_dining/service/restaurant_service.dart';
import 'package:on_time_dining/widget/left_drawer.dart';

import '../helpers/commandItemHelper.dart';
import '../helpers/panier.dart';
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
      backgroundColor: Colors.white,
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
          },
        ),
        title: const Text(
          'HOME',
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
                return Container(
                  height: 180,
                  // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: EdgeInsets.all(10.00),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/${restaurants[index].image}"),
                    fit: BoxFit.cover,
                  )),
                  child: Card(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RestaurantPlats(
                                      restaurant: restaurants[index],
                                    )));
                          },
                          child: Center(
                            child: Text("${restaurants[index].name}",
                                style: GoogleFonts.lobster(
                                  color: Colors.white,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                )),
                          ))),
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
      bottomNavigationBar: ButtomNavigationMenu(),
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
