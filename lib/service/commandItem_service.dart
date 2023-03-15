import 'package:on_time_dining/dao/commandItemDao.dart';
import 'package:on_time_dining/helpers/commandItemHelper.dart';
import 'package:on_time_dining/helpers/panier.dart';
import 'package:on_time_dining/model/CommandItem.dart';
import 'package:on_time_dining/service/command_service.dart';

import '../model/Command.dart';

class CommandItemService {
  CommandItemDao commandItemDao = CommandItemDao();
  CommandService commandService = CommandService();
  List<CommandItemHelper> panier = Panier.panier;

  void insertCommandItem() async {
    double commandTTC = 0;
    //catculate TTC
    for (int i = 0; i < panier.length; i++) {
      commandTTC += panier[i].price * panier[i].quantity;
    }
    Command command = Command(ttc: commandTTC, status: false);

    int command_id = await commandService.insertCommand(command);

    for (int i = 0; i < panier.length; i++) {
      CommandItem commandItem = CommandItem(
          quantity: panier[i].quantity,
          dish_id: panier[i].dash.id,
          command_id: command_id,
          ttc: panier[i].dash.price * panier[i].quantity);

      commandItemDao.insertCommandItem(commandItem.toMap());
    }

    Panier.panier.clear();
  }

  Future<List<Map<String, dynamic>>> getCommandItemByCommand(
      int command_id) async {
    return await commandItemDao.getCommandItemsByCommand(command_id);
  }

  void showCommandItemsInLog() async {
    List<Map<String, dynamic>> list = await commandItemDao.getAllCommandItems();
    print("................................. show commandItem method");
    print(list[1].toString());
  }
}
