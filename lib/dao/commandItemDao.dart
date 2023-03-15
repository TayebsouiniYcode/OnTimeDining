import 'package:on_time_dining/helpers/sql_helper.dart';

class CommandItemDao {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getAllCommandItems() async {
    return await DatabaseHelper.queryAll('commandItem');
  }

  Future<int> insertCommandItem(Map<String, dynamic> commandItem) async {
    return await DatabaseHelper.insert('commandItem', commandItem);
  }

  Future<int> updateCommandItem(Map<String, dynamic> commandItem) async {
    return await DatabaseHelper.update('commandItem', commandItem);
  }

  Future<int> deleteCommandItem(int commandItemId) async {
    return await DatabaseHelper.delete(
        'commandItem', 'id = ?', [commandItemId]);
  }

  Future<List<Map<String, dynamic>>> getCommandItemsByCommand(
      int command_id) async {
    return await DatabaseHelper.query(
        'commandItem', 'command_id = ?', [command_id]);
  }
}
