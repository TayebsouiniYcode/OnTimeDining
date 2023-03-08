import 'package:flutter/material.dart';
import 'package:on_time_dining/page/panier.dart';
import 'package:on_time_dining/page/profil.dart';

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
        child: Center(
          child: Text("Home page"),
        ),
      ),
      // child: ListView.builder(
      //     itemCount: _restaurants.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Container(
      //         child: Center(
      //             child: Text(
      //                 '${_restaurants[index]['id']} ${_restaurants[index]['name']} ${_restaurants[index]['description']}')),
      //       );
      //     })),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          String screen = 'Home';

          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Panier()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
              break;
          }
        },
      ),
    );
  }
}
