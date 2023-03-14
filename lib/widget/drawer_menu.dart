import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tayeb SOUINI"),
            accountEmail: Text("TayebSOUINI@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://www.example.com/profile.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/home");
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Panier"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/panier");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Restaurant"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/restaurant");
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Perform logout actions here
              Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
