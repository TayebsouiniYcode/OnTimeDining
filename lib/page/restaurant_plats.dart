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
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${widget.restaurant.name}',
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
        padding: EdgeInsets.all(20.00),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20.00)),
            Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Let's finds the best food around you at ",
                      style: TextStyle(
                          fontSize: 25.00,
                          fontFamily: 'Raleway',
                          color: Colors.black)),
                  TextSpan(
                    text: widget.restaurant.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 30.00),
                  )
                ])),
                Padding(padding: EdgeInsets.all(30.00)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.green,
                          size: 16,
                        ),
                        Text(
                          "${widget.restaurant.city}, ${widget.restaurant.country}",
                          style: const TextStyle(
                              fontSize: 16.00, color: Colors.green),
                        )
                      ],
                    ),
                    Text(
                      widget.restaurant.phone,
                      style:
                          const TextStyle(color: Colors.green, fontSize: 16.00),
                    )
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.00)),
            Expanded(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/${dashList[index].image}'),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                        "${dashList[index].title}",
                                        style: TextStyle(
                                            fontSize: 20.00,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Container(
                                          child: Text(
                                              "${dashList[index].description}")),
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
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.green),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          side: BorderSide(color: Colors.green)))),
                                              onPressed: () {
                                                Panier.panier
                                                    .add(dashList[index]);
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
            )
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}
