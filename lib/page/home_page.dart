import 'package:flutter/material.dart';

import '../helpers/sql_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _restaurants = [];

  bool _isLoading = true;

  void _refreshRestaurants() async {
    // SqlHelper.db();
    // SqlHelper.createRestaurant(
    //     "YouFood", "description", "city", "country", "zip_code");
    final data = await SqlHelper.getRestaurants();
    setState(() {
      _restaurants = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () => print("back tapped"),
          ),
          title: Center(
            child: Text("Restaurants List"),
          ),
          actions: [
            GestureDetector(
              child: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: Container(
            child: ListView.builder(
                itemCount: _restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    child: Center(
                        child: Text(
                            '${_restaurants[index]['id']} ${_restaurants[index]['name']} ${_restaurants[index]['description']}')),
                  );
                }
                )
                )
                );
  }
}
