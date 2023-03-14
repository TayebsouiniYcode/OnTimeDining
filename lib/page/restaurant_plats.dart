import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/panier.dart';
import 'package:on_time_dining/model/Dash.dart';
import 'package:on_time_dining/page/dash_details.dart';
import 'package:on_time_dining/service/dash_service.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';

import '../model/Restaurant.dart';
import 'check.dart';

class RestaurantPlats extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPlats({super.key, required this.restaurant});

  @override
  State<RestaurantPlats> createState() => _RestaurantPlatsState();
}

class _RestaurantPlatsState extends State<RestaurantPlats> {
  DashService dashService = DashService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.only(right: 10.00),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: dashService.getDashByRestaurant(widget.restaurant.id),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              List<Map<String, dynamic>> dashMaps = snapshot.data!;
              List<Dash> dashList =
                  dashMaps.map((map) => Dash.fromMap(map)).toList();
              return ListView.builder(
                  itemCount: dashList.length,
                  itemBuilder: (BuildContext context, int index) {
                    //TODO this is a card of Dash to refactoring
                    return Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Image(
                              image:
                                  AssetImage('images/${dashList[index].image}'),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                  "${dashList[index].title}",
                                  style: TextStyle(
                                      fontSize: 20.00,
                                      fontWeight: FontWeight.bold),
                                )),
                                Container(
                                    child:
                                        Text("${dashList[index].description}")),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ ${dashList[index].price}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.green),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                    side: BorderSide(
                                                        color: Colors.green)))),
                                        onPressed: () {
                                          Panier.panier.add(dashList[index]);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CheckPage()),
                                          );
                                        })
                                  ],
                                )
                              ]),
                        )
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}

// class RestaurantPlats extends StatelessWidget {
//   late Restaurant _restaurant;
//   RestaurantPlats({super.key, required Restaurant restaurant}) {
//     _restaurant = restaurant;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: GestureDetector(
//           child: const Icon(
//             Icons.arrow_back_sharp,
//             color: Colors.black,
//           ),
//           onTap: () {
//             //TODO previous page
//           },
//         ),
//         title: Text(
//           '${_restaurant.name}',
//           style: TextStyle(color: Colors.black),
//         ),
//         shadowColor: Colors.black,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//               color: Colors.black,
//             ),
//           )
//         ],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//           child: Column(children: [
//         Categories(),
//         PopularDash(),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.all(12),
//           child: Row(
//             // children: const [DashCard()],
//             children: [
//               DashCard(
//                   title: "Burger",
//                   description: "Taste our Hot Burger",
//                   image: "burger.png",
//                   price: "10"),
//               DashCard(
//                   title: "Burger",
//                   description: "Taste our Hot Burger",
//                   image: "dash1.jpg",
//                   price: "10"),
//               DashCard(
//                   title: "Burger",
//                   description: "Taste our Hot Burger",
//                   image: "dash2.jpg",
//                   price: "10"),
//               DashCard(
//                   title: "Burger",
//                   description: "Taste our Hot Burger",
//                   image: "dash3.jpg",
//                   price: "10"),
//               DashCard(
//                   title: "Burger",
//                   description: "Taste our Hot Burger",
//                   image: "burger.png",
//                   price: "10")
//             ],
//           ),
//         ),
//         DashList(),
//       ])),
//       bottomNavigationBar: ButtomNavigationMenu(),
//     );
//   }
// }
