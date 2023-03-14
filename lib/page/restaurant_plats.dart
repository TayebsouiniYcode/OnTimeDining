import 'package:flutter/material.dart';
import 'package:on_time_dining/model/Dash.dart';
import 'package:on_time_dining/page/dash_details.dart';
import 'package:on_time_dining/service/dash_service.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';
import 'package:on_time_dining/widget/category.dart';
import 'package:on_time_dining/widget/dash_card.dart';
import 'package:on_time_dining/widget/dash_list.dart';
import 'package:on_time_dining/widget/popular_dash.dart';

import '../model/Restaurant.dart';

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
        title: Text('${widget.restaurant.name}'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
                  return Container(
                    padding: EdgeInsets.all(20.00),
                    margin: EdgeInsets.all(10.00),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.indigoAccent),
                          padding: EdgeInsets.all(20.00),
                          child: GestureDetector(
                            child: Row(
                              children: [
                                Text("Dash title: ${dashList[index].title}"),
                                Text(
                                    "dash price: \$ ${dashList[index].price.toString()}")
                              ],
                            ),
                            onTap: () {
                              print("tap dash id : ${dashList[index].id}");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DashDetails(
                                        dash: dashList[index],
                                      )));
                            },
                          ),
                        )
                      ],
                    ),
                  );
                  // return co(
                  //   child: Text("Dash title : ${dashList[index].title}"),
                  // );
                });
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
