// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/widgits/appbar.dart';
import 'package:movieapp/widgits/bottomappbar.dart';
import 'package:movieapp/widgits/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Trailer extends StatelessWidget {
  final List trailer;
  final Uri url = Uri.parse('https://www.youtube.com/watch?v=h6hZkvrFIj0');

  Trailer({Key? key, required this.trailer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Text(
            "Watch Trailer on Youtube",
            style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: trailer.length,
              itemBuilder: ((context, index) => Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                      ),
                      onPressed: () async {
                        final url = "https://www.youtube.com/watch?v=" +
                            trailer[index]['key'];
                        if (await canLaunch(url)) {
                          await launch(url, forceWebView: true);
                        }
                      },
                      child: Text(
                        "${trailer[index]['name']}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ))),
        )
      ],
    );
  }
}
