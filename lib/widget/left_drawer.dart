import 'package:flutter/material.dart';
import 'package:on_time_dining/helpers/commandItemHelper.dart';
import 'package:on_time_dining/helpers/panier.dart';

class DrawerPanier extends StatefulWidget {
  List<CommandItemHelper> panier = Panier.panier;
  double price = 0.0;
  DrawerPanier({super.key});

  @override
  State<DrawerPanier> createState() => _DrawerPanierState();
}

class _DrawerPanierState extends State<DrawerPanier> {
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Padding(padding: EdgeInsets.only(bottom: 40)),
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
              Padding(padding: EdgeInsets.only(bottom: 60)),
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
                    const Padding(padding: EdgeInsets.only(bottom: 30.00)),
                    ElevatedButton(
                        onPressed: () {
                          print("checked");
                        },
                        child: Icon(Icons.check))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
