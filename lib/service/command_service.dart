import 'package:on_time_dining/dao/commandDao.dart';
import 'package:on_time_dining/helpers/profil_details.dart';

import '../model/Command.dart';

class CommandService {
  CommandDao commandDao = CommandDao();

  Future<int> insertCommand(Command command) async {
    return await commandDao.insertCommand(command.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllCommand() async {
    List<Map<String, dynamic>> list = await commandDao.getAllCommand();
    print("...... Command service ");
    print(list);
    return list;
  }

  Future<List<Command>> getCommandList() async {
    return await ProfilDetails.getCommandListStatic();
  }

  void updateCommand(Command command) {
    commandDao.updateCommand(command.toMap());
  }
}
