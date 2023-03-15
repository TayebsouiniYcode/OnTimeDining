import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:on_time_dining/page/home_page.dart';
import 'package:on_time_dining/page/restaurant_plats.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 127, 43, 43),
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onTap: () {
            //TODO previous page
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Ajouter',
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 1),
            () {
              return;
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text("Ajouter au panier ..."),
                ],
              );
            }
            return FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 1),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      SizedBox(height: 15),
                      Text("le plat a été ajouté avec success"),
                    ],
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
