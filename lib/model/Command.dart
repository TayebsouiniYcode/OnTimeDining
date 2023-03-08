import 'package:on_time_dining/model/CommandItem.dart';

class Command {
  late int id;
  late double ttc;
  late bool status;
  late DateTime createdAt;
  late List<CommandItem> items;
}
