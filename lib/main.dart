import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movie.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBJPx4QPCIN1KktVMxLA4c4JqCLA9NxMs8",
      appId: "",
      messagingSenderId: "1086972069633",
      projectId: "moviesapp14",
    ),
  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return Homescreen();
          } else {
            return Login();
          }
        },
      )),
    );
  }
}
