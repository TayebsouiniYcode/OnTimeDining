import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/sql_helper.dart';
import 'package:on_time_dining/model/Restaurant.dart';
import 'package:on_time_dining/page/home_page.dart';
import 'package:on_time_dining/service/category_service.dart';
import 'package:on_time_dining/service/dash_service.dart';
import 'package:on_time_dining/service/restaurant_service.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  RestaurantService restaurantService = RestaurantService();
  CategoryService categoryService = CategoryService();
  DashService dashService = DashService();

  // restaurantService.insertRestaurant();
  // categoryService.insertCategory();
  // dashService.insertDash();

  // dashService.getAllDash();
  // dashService.getDashByRestaurant(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On Time Dining',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
