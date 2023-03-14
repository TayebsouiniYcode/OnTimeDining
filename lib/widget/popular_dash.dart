import 'package:flutter/material.dart';

class PopularDash extends StatelessWidget {
  const PopularDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: Image(
                    image: AssetImage("images/popularDash.jpg"),
                    fit: BoxFit.cover,
                    height: double.infinity, // set your height
                    width: double.infinity,
                  ),
                  // child: Text("Popular"),
                ),
              )),
        ),
      ),
    );
  }
}
