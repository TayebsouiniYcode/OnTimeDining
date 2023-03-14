import 'package:on_time_dining/helpers/sql_helper.dart';

class CategoryDao {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    return await DatabaseHelper.queryAll('category');
  }

  Future<int> insertRestaurant(Map<String, dynamic> category) async {
    return await DatabaseHelper.insert('category', category);
  }

  Future<int> updateRestaurant(Map<String, dynamic> category) async {
    return await DatabaseHelper.update('category', category);
  }

  Future<int> deleteRestaurant(int categoryId) async {
    return await DatabaseHelper.delete('category', 'id = ?', [categoryId]);
  }
}
