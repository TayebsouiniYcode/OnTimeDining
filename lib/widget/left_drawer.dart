import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/commandItemHelper.dart';
import 'package:on_time_dining/helpers/panier.dart';
import 'package:on_time_dining/service/commandItem_service.dart';
import 'package:on_time_dining/service/profil_service.dart';

class DrawerPanier extends StatefulWidget {
  List<CommandItemHelper> panier = Panier.panier;
  double price = 0.0;
  DrawerPanier({super.key});

  @override
  State<DrawerPanier> createState() => _DrawerPanierState();
}

class _DrawerPanierState extends State<DrawerPanier> {
  CommandItemService commandItemService = CommandItemService();
  ProfilDetailsService profilDetailsService = ProfilDetailsService();
  @override
  void initState() {
    super.initState();
    double p = 0;
    for (int i = 0; i < widget.panier.length; i++) {
      p += widget.panier[i].price * widget.panier[i].quantity;
    }
    widget.price = p;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        width: 100.0,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 60, 5, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 12)),
              Text(
                "Carte",
                style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold),
              ),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.transparent,
              //       foregroundColor: Colors.black,
              //       elevation: 0,
              //     ),
              //     child: Icon(
              //       Icons.close,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     }),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Container(
                  height: 420,
                  width: 80,
                  child: ListView.builder(
                      itemCount:
                          widget.panier == null ? 0 : widget.panier.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image(
                              image: AssetImage(
                                  'images/${widget.panier[index].dash.image}'),
                              height: 80.0,
                              width: 80.0,
                              fit: BoxFit.cover, //change image fill type
                            ),
                          ),
                        );
                      })),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Container(
                child: Column(
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10.00)),
                    Text(
                      "${widget.panier.length} items",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10.00)),
                    Text(
                      "\$ ${widget.price}",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20.00)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.green,
                            )),
                        onPressed: () {
                          commandItemService.insertCommandItem();
                          profilDetailsService.chargeProfilDetails();

                          Navigator.of(context).pop();
                          sendNotification(double prixTotal) {
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                                    id: 10,
                                    channelKey: 'channelKey',
                                    title: 'commande est ajouter avec success',
                                    body: 'prix Total '));
                          }
                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
