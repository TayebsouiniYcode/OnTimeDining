import 'package:flutter/material.dart';

class DashDetailsWidget extends StatelessWidget {
  // const DashDetailsWidget({super.key});

  String title = "burger";
  String description = "this is simple static description";
  double price = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(50),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15))
              ],
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: AssetImage("images/dash1.jpg"), fit: BoxFit.fill),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title",
                style: TextStyle(fontSize: 30.00, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$ $price",
                style: TextStyle(fontSize: 30.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text(
                  "4.8",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.access_time,
                  color: Colors.orange,
                ),
                Text(
                  "20 - 30 min",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ],
            ),
            Container(
                // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                color: Color.fromARGB(44, 193, 42, 42),
                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: Row(
                  children: const [
                    Icon(
                      Icons.delivery_dining,
                      color: Colors.red,
                    ),
                    Text(
                      "Free Delivery",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )),
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: const Text(
                "Details",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(
                "$description",
                style: TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 50),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //
                  },
                  child: Text("ADD TO CART"),
                ))
          ],
        ),
      ]),
    );
  }
}
