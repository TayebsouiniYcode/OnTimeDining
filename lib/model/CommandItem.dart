import 'package:on_time_dining/model/Command.dart';
import 'package:on_time_dining/model/Dash.dart';

class CommandItem {
  late int id;
  final int quantity;
  final int dish_id;
  final int command_id;
  final double ttc;

  CommandItem(
      {required this.quantity,
      required this.dish_id,
      required this.command_id,
      required this.ttc});

  Map<String, dynamic> toMap() {
    return {
      'id': null,
      'quantity': quantity,
      'dish_id': dish_id,
      'command_id': command_id,
      'ttc': ttc
    };
  }

  factory CommandItem.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      CommandItem commandItem =
          CommandItem(quantity: 0, dish_id: -1, command_id: -1, ttc: 0);

      commandItem.id = -1;

      return commandItem;
    }

    CommandItem commandItem = CommandItem(
        quantity: map['quantity'] ?? 0,
        dish_id: map['dish_id'] ?? -1,
        command_id: map['command_id'] ?? -1,
        ttc: map['ttc'] ?? 0);

    commandItem.id = map['id'] ?? -1;

    return commandItem;
  }

  @override
  String toString() =>
      'CommandItem {id: $id, dish_id: $dish_id, command_id: $command_id, quantity : $quantity, ttc: $ttc }';
}
