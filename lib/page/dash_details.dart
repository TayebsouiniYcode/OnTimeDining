import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:on_time_dining/model/Dash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/panier.dart';

class DashDetails extends StatefulWidget {
  final Dash dash;
  const DashDetails({super.key, required this.dash});

  @override
  State<DashDetails> createState() => _DashDetailsState();
}

class _DashDetailsState extends State<DashDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.dash.title}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Text("dash title: ${widget.dash.title}"),
          Text("description: ${widget.dash.description}"),
          Text("price : ${widget.dash.price}"),
          Container(
            padding: EdgeInsets.all(30.00),
            margin: EdgeInsets.all(15.00),
            decoration: BoxDecoration(color: Colors.amberAccent),
            child: GestureDetector(
              child: Text("Add to carte"),
              onTap: () async {
                print(Panier.panier.length);
                Panier.panier.add(widget.dash);
              },
            ),
          )
        ]),
      ),
    );
  }
}
