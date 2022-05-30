import 'package:flutter/material.dart';

import 'bottomappbar.dart';
import 'drawer.dart';

class Moviesearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
              child: GestureDetector(
                child: const Text("Search",
                    style: TextStyle(color: Colors.yellow)),
                onTap: () {},
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.yellow,
                ),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.yellow)),
        drawer: Moviedrawer(),
        bottomNavigationBar: Moviebottomappbar(),
      ),
    );
  }
}

class MoviesDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
              child: GestureDetector(
                child: const Text("Download",
                    style: TextStyle(color: Colors.yellow)),
                onTap: () {},
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.yellow,
                ),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.yellow)),
        drawer: Moviedrawer(),
        bottomNavigationBar: Moviebottomappbar(),
      ),
    );
  }
}
