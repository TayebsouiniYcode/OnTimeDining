import 'dart:ffi';

import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  // const DashCard({super.key});

  String title = "";
  String description = "";
  String image = "";
  String price = "0";

  DashCard(
      {super.key,
      required String title,
      required String description,
      required String image,
      required String price}) {
    this.title = title;
    this.description = description;
    this.image = image;
    this.price = price;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: 250,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/$image",
                  height: 100,
                ),
              ),
              Text(
                "$title",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "$description",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 26,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
