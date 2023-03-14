import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(0, 127, 43, 43),
      elevation: 0,
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        onTap: () {
          //TODO previous page
        },
      ),
      title: const Text(
        'HOME',
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
    );
  }
}
