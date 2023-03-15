import 'package:flutter/material.dart';
import 'package:on_time_dining/model/Command.dart';
import 'package:on_time_dining/service/command_service.dart';
import 'package:on_time_dining/service/profil_service.dart';
import 'package:on_time_dining/widget/bottom_navigation.dart';
import 'package:on_time_dining/widget/left_drawer.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  CommandService commandService = CommandService();
  ProfilDetailsService profilDetailsService = ProfilDetailsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPanier(),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text("this is commands"),
          ),
          Container(
            height: 400,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: commandService.getAllCommand(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> commandMaps = snapshot.data!;
                  List<Command> commandList =
                      commandMaps.map((map) => Command.fromMap(map)).toList();
                  return ListView.builder(
                      itemCount: commandList.length,
                      itemBuilder: (BuildContext context, int index) {
                        //TODO this is a card of Dash to refactoring
                        return Row(
                          children: [
                            Text(commandList[index].id.toString()),
                            Text(commandList[index].ttc.toString()),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                profilDetailsService.chargeProfilDetails();
              },
              child: Text("Click me to charge profileDetails list"))
        ],
      ),
      bottomNavigationBar: ButtomNavigationMenu(),
    );
  }
}
