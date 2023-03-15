import '../model/Command.dart';

class ProfilDetails {
  static List<Command> commandList = [];

  static Future<List<Command>> getCommandListStatic() async {
    return await commandList;
  }

  static double totalSalesInThisApplication() {
    double total = 0;
    for (int i = 0; i < commandList.length; i++) {
      total += commandList[i].ttc;
    }
    return total;
  }
}
