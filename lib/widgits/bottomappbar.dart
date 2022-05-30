import 'package:flutter/material.dart';

import 'package:movieapp/widgits/searchbar.dart';
import 'package:movieapp/widgits/sidedrawer.dart';

import '../movie.dart';

class Moviebottomappbar extends StatefulWidget {
  @override
  State<Moviebottomappbar> createState() => _MoviebottomappbarState();
}

class _MoviebottomappbarState extends State<Moviebottomappbar> {
  bool color1 = false;
  bool color2 = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BottomAppBar(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            GestureDetector(
                child: Icon(Icons.home,
                    color: color1 ? Colors.yellowAccent : Colors.black,
                    size: 30),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                  setState(() {
                    color1 = !color1;
                    print(color1);
                  });
                }),
            GestureDetector(
                child: Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: color2 ? Colors.yellowAccent : Colors.black,
                ),
                onTap: () {
                  setState(() {
                    color2 = !color2;
                    print(color1);
                  });

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Moviesearchbar()));
                }),
            InkWell(
                child: Icon(Icons.download_outlined,
                    size: 30, color: Colors.black),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviesDownload()));
                }),
            GestureDetector(
              child: Icon(Icons.person, color: Colors.black),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Moviesidedrawer()));
              },
            ),
          ]));
    });
  }
}
