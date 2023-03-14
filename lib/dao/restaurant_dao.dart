import '../helpers/sql_helper.dart';

class RestaurantDao {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getAllRestaurants() async {
    return await DatabaseHelper.queryAll('restaurant');
  }

  Future<int> insertRestaurant(Map<String, dynamic> restaurant) async {
    return await DatabaseHelper.insert('restaurant', restaurant);
  }

  Future<int> updateRestaurant(Map<String, dynamic> restaurant) async {
    return await DatabaseHelper.update('restaurant', restaurant);
  }

  Future<int> deleteRestaurant(int restaurantId) async {
    return await DatabaseHelper.delete('restaurant', 'id = ?', [restaurantId]);
  }
}
