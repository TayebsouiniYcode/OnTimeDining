import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/profil_details.dart';
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
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello Client",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                const Text(
                  "You have ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  "${ProfilDetails.commandList.length} Commandes",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  "Total : \$ ${ProfilDetails.totalSalesInThisApplication()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
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
                        return Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      width: 2, // the thickness
                                      color: Colors
                                          .black // the color of the border
                                      )),
                              onPressed: () {
                                print("TTT");
                              },
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'images/${ProfilDetails.commandList[0].commandItemList[0].dish!.image}'),
                                    width: 170,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date : (comming soon)",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 30)),
                                      Text(
                                        '\$ ${commandList[index].ttc.toString()}',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )
                                ],
                              )),
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

  // String getCommandTTC(Command command) {
  //   double ttc = 0;
  //   for(int i = 0; i < command.commandItemList.length; i++) {
  //     ttc += command.
  //   }
  //   return 'test';
  // }
}
