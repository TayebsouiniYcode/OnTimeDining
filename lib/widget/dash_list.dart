// ignore: file_names
import 'package:flutter/material.dart';
import 'package:on_time_dining/widget/dash_details.dart';

class DashList extends StatelessWidget {
  const DashList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Top Rated",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
              height: 600,
              child: ListView(
                children: <Widget>[
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: 60.0,
                          child: const Image(
                            image: AssetImage("images/burger.png"),
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 17.00,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Description in this line"),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "\$30",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            //TODO
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DashDetailsWidget()));
                                          },
                                          child: const Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: Colors.amber,
                                          )),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: 60.0,
                          child: const Image(
                            image: AssetImage("images/burger.png"),
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 17.00,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Description in this line"),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "\$30",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            //TODO
                                          },
                                          child: const Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: Colors.amber,
                                          )),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: 60.0,
                          child: const Image(
                            image: AssetImage("images/burger.png"),
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 17.00,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Description in this line"),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "\$30",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            //TODO
                                          },
                                          child: const Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: Colors.amber,
                                          )),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.20,
                          height: 60.0,
                          child: const Image(
                            image: AssetImage("images/burger.png"),
                            width: double.infinity,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 17.00,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Description in this line"),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "\$30",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            //TODO
                                          },
                                          child: const Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: Colors.amber,
                                          )),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
    // return ListView(
    //   children: <Widget>[
    //     Container(
    //       height: 50,
    //       color: Colors.amber[600],
    //       child: const Center(child: Text('Entry A')),
    //     )
    //   ],
    // );
  }
}

// SizedBox(
//             height: 600,
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   height: 50,
//                   color: Colors.amber[600],
//                   child: const Center(child: Text('Entry A')),
//                 ),
//                 Container(
//                   height: 50,
//                   color: Colors.amber[500],
//                   child: const Center(child: Text('Entry B')),
//                 ),
//                 Container(
//                   height: 50,
//                   color: Colors.amber[100],
//                   child: const Center(child: Text('Entry C')),
//                 ),
//               ],
//             )),
