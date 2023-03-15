import 'package:on_time_dining/helpers/sql_helper.dart';

class DashDao {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getDashByRestaurantId(
      int restaurantId) async {
    return await DatabaseHelper.query(
        'dash', 'restaurantId = ?', [restaurantId]);
  }

  Future<List<Map<String, dynamic>>> getAllDash() async {
    return await DatabaseHelper.queryAll('dash');
  }

  Future<int> insertRestaurant(Map<String, dynamic> dash) async {
    return await DatabaseHelper.insert('dash', dash);
  }

  Future<int> updateRestaurant(Map<String, dynamic> dash) async {
    return await DatabaseHelper.update('dash', dash);
  }

  Future<int> deleteRestaurant(int dashId) async {
    return await DatabaseHelper.delete('dash', 'id = ?', [dashId]);
  }

  Future<List<Map<String, dynamic>>> getDashById(int dish_id) async {
    return await DatabaseHelper.query('dash', 'id = ?', [dish_id]);
  }
}
