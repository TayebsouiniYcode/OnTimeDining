import 'package:on_time_dining/model/CommandItem.dart';

class Command {
  late int id;
  final double ttc;
  final bool status;

  List<CommandItem> commandItemList = [];

  Command({required this.ttc, required this.status});

  Map<String, dynamic> toMap() {
    return {'id': null, 'ttc': ttc, 'status': status};
  }

  factory Command.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      Command command = Command(ttc: 0, status: false);
      command.id = -1;
      return command;
    }

    Command command = Command(ttc: map['ttc'] ?? 0, status: false);
    command.id = map['id'] ?? -1;

    return command;
  }

  @override
  String toString() {
    return 'Command { id: $id, status: $status, ttc: $ttc, Command items: { $commandItemList }}';
  }
}
