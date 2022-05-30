import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/login.dart';
import 'package:movieapp/movie.dart';

class Moviedrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Drawer(
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("Icons/star.png"),
                  color: Colors.yellowAccent,
                  size: 70,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              tileColor: Colors.yellowAccent,
              title: GestureDetector(
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                },
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
              tileColor: Colors.yellowAccent,
              title: Text("Contact us", style: TextStyle(color: Colors.black)),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
              title: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellowAccent,
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text("Log Out",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          )),
          const Divider(
            color: Colors.black,
          ),
        ]),
      );
    });
  }
}
