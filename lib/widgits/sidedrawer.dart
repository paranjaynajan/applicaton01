import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movie.dart';

import '../login.dart';

class Moviesidedrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  List globaldata = [];
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ImageIcon(
                        AssetImage("Icons/ninja.png"),
                        color: Colors.yellowAccent,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Movieapp")
                    .snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final data1 = snapshots.data!.docs;
                    globaldata = data1;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: ((context, index) {
                            return ListTile(
                                title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Username- ${data1[index]['username']}",
                                    style: const TextStyle(
                                        color: Colors.yellowAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const Divider(
                                  color: Colors.yellowAccent,
                                ),
                                Text("Email- ${data1[index]['email']}",
                                    style: const TextStyle(
                                        color: Colors.yellowAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const Divider(
                                  color: Colors.yellowAccent,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellowAccent,
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          minimumSize: const Size(10, 50),
                                        ),
                                        child: const Text("Log out"),
                                        onPressed: () {
                                          signOut();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.yellowAccent,
                                            onPrimary: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            minimumSize: const Size(10, 50),
                                          ),
                                          child: const Text("Home"),
                                          onPressed: (() => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Homescreen())))),
                                    ),
                                  ],
                                )
                              ],
                            ));
                          })),
                    );
                  }
                },
              ),
            ),
          ),
        ]),
      );
    });
  }
}
