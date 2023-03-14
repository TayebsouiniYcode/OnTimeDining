import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ajouter au panier"),
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
                  Navigator.pop(context);
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