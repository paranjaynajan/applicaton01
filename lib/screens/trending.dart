import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/widgits/appbar.dart';
import 'package:movieapp/widgits/bottomappbar.dart';
import 'package:movieapp/widgits/drawer.dart';

class TrendingMovie extends StatelessWidget {
  final List trending;

  TrendingMovie({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Text(
            "Trending Movies",
            style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.37,
          child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => InkWell(
                    child: Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Image.network(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "${trending[index]['original_title']}",
                                  style: const TextStyle(
                                      color: Colors.yellowAccent, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Details(a: index, t: trending)));
                    },
                  ))),
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  var a = 0;
  List t;
  Details({Key? key, required this.a, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: MovieAppBar(),
            body: Stack(fit: StackFit.loose, children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                child: Image.network(
                    fit: BoxFit.cover,
                    // ignore: prefer_interpolation_to_compose_strings
                    'https://image.tmdb.org/t/p/w500' + t[a]['backdrop_path']),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: Image.network(
                            fit: BoxFit.cover,
                            // ignore: prefer_interpolation_to_compose_strings
                            'https://image.tmdb.org/t/p/w500' +
                                t[a]['poster_path']),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 38, 0, 0),
                              child: Text(
                                "${t[a]['title']}",
                                style: const TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 5, 0, 7),
                              child: Text(
                                "Release date: ${t[a]['release_date']} ",
                                style: const TextStyle(
                                    color: Colors.yellowAccent, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.yellowAccent,
                                  ),
                                  child: const Text("Watch Trailer",
                                      style: TextStyle(color: Colors.black))),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Rating:",
                        style:
                            TextStyle(color: Colors.yellowAccent, fontSize: 20),
                      ),
                      RatingBar.builder(
                        initialRating: t[a]['vote_average'],
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Description:\n${t[a]['overview']}",
                            style: const TextStyle(
                                color: Colors.yellowAccent, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.favorite),
                        Icon(Icons.share),
                        Icon(Icons.message_outlined)
                      ],
                    ),
                  )
                ],
              ),
            ]),
            drawer: Moviedrawer(),
            bottomNavigationBar: Moviebottomappbar(),
          );
        }));
  }
}
