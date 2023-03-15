import '../helpers/sql_helper.dart';

class CommandDao {
  final dbHelper = DatabaseHelper.instance;

  Future<List<Map<String, dynamic>>> getAllCommand() async {
    return await DatabaseHelper.queryAll('command');
  }

  Future<int> insertCommand(Map<String, dynamic> command) async {
    return await DatabaseHelper.insert('command', command);
  }

  Future<int> updateCommand(Map<String, dynamic> command) async {
    return await DatabaseHelper.update('command', command);
  }

  Future<int> deleteCommand(int commandId) async {
    return await DatabaseHelper.delete('command', 'id = ?', [commandId]);
  }

  // Future<int> getlastCommandId() async {
  //   return await DatabaseHelper.
  //   // return await DatabaseHelper.query('command', 'max', whereArgs)
  // }
}
