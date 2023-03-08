import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

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
      body: Container(
        child: ListView.builder(
            itemCount: _restaurants.length,
            itemBuilder: (BuildContext context, int index) {
              return new Text(_restaurants[index]['name']);
            }),
      ),
    );
  }
}
