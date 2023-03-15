import 'package:on_time_dining/helpers/profil_details.dart';
import 'package:on_time_dining/model/Command.dart';
import 'package:on_time_dining/model/CommandItem.dart';
import 'package:on_time_dining/model/Dash.dart';
import 'package:on_time_dining/service/commandItem_service.dart';
import 'package:on_time_dining/service/command_service.dart';
import 'package:on_time_dining/service/dash_service.dart';

class ProfilDetailsService {
  CommandService commandService = CommandService();
  CommandItemService commandItemService = CommandItemService();
  DashService dashService = DashService();

  void chargeProfilDetails() async {
    // TODO
    // To refactoring.....................
    List<Map<String, dynamic>> list = await commandService.getAllCommand();
    //TODO HAHAHA 00:26
    ProfilDetails.commandList.clear();
    //get all command for this profil
    for (int i = 0; i < list.length; i++) {
      ProfilDetails.commandList.add(Command.fromMap(list[i]));
    }

    //get all command items and add to command
    for (int i = 0; i < ProfilDetails.commandList.length; i++) {
      List<Map<String, dynamic>> commandItemlist = await commandItemService
          .getCommandItemByCommand(ProfilDetails.commandList[i].id);

      for (int j = 0; j < commandItemlist.length; j++) {
        CommandItem commandItem = CommandItem.fromMap(commandItemlist[j]);

        List<Map<String, dynamic>> dish =
            await dashService.getDishByCommandItemDishId(commandItem.dish_id);

        commandItem.dish = Dash.fromMap(dish[0]);

        ProfilDetails.commandList[i].commandItemList.add(commandItem);
      }
    }

    // get all product by command Item

    //check if command is present in this list of command inside profileDetails class
    print(
        "................ this is test inside ProfileDetailsService for testing if command is present in static list");
    for (int i = 0; i < ProfilDetails.commandList.length; i++) {
      print(ProfilDetails.commandList[i].toString());
    }
  }
}
