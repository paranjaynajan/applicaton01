import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/screens/toratedtv.dart';
import 'package:movieapp/screens/trailers.dart';
import 'package:movieapp/screens/trending.dart';
import 'package:movieapp/widgits/appbar.dart';
import 'package:movieapp/widgits/bottomappbar.dart';
import 'package:movieapp/widgits/drawer.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'screens/generatedlist.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String movieapikey = "f973e4356dfd49a2003b1557016fc5d0";
  String apitoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTczZTQzNTZkZmQ0OWEyMDAzYjE1NTcwMTZmYzVkMCIsInN1YiI6IjYyNmI5YzZjZTNmYTJmMGEyMDE4NzM2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZcYKa3vHG1-PqB2gnPs3ebcWfWlyRViqyJSx2w1TfmI";
  List trend = [];
  List tv = [];
  List trail = [];
  late var i;

  loadingmovie() async {
    TMDB tmdb = TMDB(ApiKeys(movieapikey, apitoken),
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));
    Map trendmovie = await tmdb.v3.trending.getTrending();

    Map gen = await tmdb.v3.movies.getVideos(5);
    Map toptv = await tmdb.v3.tv.getPopular();

    setState(() {
      trend = trendmovie['results'];
      tv = toptv['results'];
      trail = gen['results'];
    });
  }

  @override
  void initState() {
    loadingmovie();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: MovieAppBar(),
            body: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: TrendingMovie(
                        trending: trend,
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Topratedtv(topratedtv: tv)),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Trailer(trailer: trail)),
                    Container(
                      height: MediaQuery.of(context).size.height * .95,
                      child: pqr(),
                    )
                  ],
                ),
              ),
            ),
            drawer: Moviedrawer(),
            bottomNavigationBar: Moviebottomappbar(),
          );
        }));
  }
}
