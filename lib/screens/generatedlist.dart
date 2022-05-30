import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class pqr extends StatelessWidget {
  var mlist = [
    {
      'text1': "AVENGERS",
      'TEXT': "images/download.jpg",
      'text2': "R 1h 21m",
      'text3': "Year:2012",
    },
    {
      'text1': "The Dark Knight",
      'TEXT': "images/dk.jpg",
      'text2': "R 1h 40m",
      'text3': "Year:2010"
    },
    {
      'text1': "INCEPTION",
      'TEXT': "images/ins.jpg",
      'text2': "R 2h 20m",
      'text3': "Year:2011",
    },
    {
      'text1': "THE MATRIX",
      'TEXT': "images/mat.jpg",
      'text2': "UA 1h 28m",
      'text3': "Year:2004",
    },
    {
      'text1': "THE LUCKY ONE",
      'TEXT': "images/lo.jpg",
      'text2': "UA 1h 15m",
      'text3': "Year:2015",
    },
    {
      'text1': "THE FAULT IN OUR STARS",
      'TEXT': "images/tfios.jpg",
      'text2': "UA 1h 55m",
      'text3': "Year:2015",
    },
    {
      'text1': "THE DARK KNIGT RISES",
      'TEXT': "images/dk1.jpg",
      'text2': "UA 1h 55m",
      'text3': "Year:2012"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Favourite Movies",
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var i = 0; i < mlist.length; i++)
                        GestureDetector(
                            child: Card(
                              elevation: 8,
                              child: ListTile(
                                textColor: Colors.black,
                                leading: Image.asset("${mlist[i]['TEXT']}"),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(mlist[i]['text1'] as String,
                                        style: const TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 15)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(mlist[i]['text3'] as String,
                                            style: const TextStyle(
                                                color: Colors.yellowAccent,
                                                fontSize: 15)),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                subtitle: Text(mlist[i]['text2'] as String,
                                    style: const TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 15)),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Secondscreen(
                                            a: i,
                                          )));
                            })
                    ]),
              ],
            );
          }),
        ));
  }
}

class Secondscreen extends StatelessWidget {
  var mlist = [
    {
      'text1': "AVENGERS",
      'TEXT': "images/download.jpg",
      'text2': "R 1h 21m",
      'text3':
          "A drift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.",
    },
    {
      'text1': "The Dark Knight",
      'TEXT': "images/dk.jpg",
      'text2': "R 1h 40m",
      'text3':
          "It has been eight years since Batman (Christian Bale), in collusion with Commissioner Gordon (Gary Oldman), vanished into the night. Assuming responsibility for the death of Harvey Dent, Batman sacrificed everything for what he and Gordon hoped would be the greater good. However, the arrival of a cunning cat burglar (Anne Hathaway) and a merciless terrorist named Bane (Tom Hardy) force Batman out of exile and into a battle he may not be able to win."
    },
    {
      'text1': "INCEPTION",
      'TEXT': "images/ins.jpg",
      'text2': "R 2h 20m",
      'text3':
          "Dom Cobb (Leonardo DiCaprio) is a thief with the rare ability to enter people's dreams and steal their secrets from their subconscious. His skill has made him a hot commodity in the world of corporate espionage but has also cost him everything he loves. Cobb gets a chance at redemption when he is offered a seemingly impossible task: Plant an idea in someone's mind. If he succeeds, it will be the perfect crime, but a dangerous enemy anticipates Cobb's every move.",
    },
    {
      'text1': "THE MATRIX",
      'TEXT': "images/mat.jpg",
      'text2': "UA 1h 28m",
      'text3':
          "Neo (Keanu Reeves) believes that Morpheus (Laurence Fishburne), an elusive figure considered to be the most dangerous man alive, can answer his question -- What is the Matrix? Neo is contacted by Trinity (Carrie-Anne Moss), a beautiful stranger who leads him into an underworld where he meets Morpheus. They fight a brutal battle for their lives against a cadre of viciously intelligent secret agents. It is a truth that could cost Neo something more precious than his life.",
    },
    {
      'text1': "THE LUCKY ONE",
      'TEXT': "images/lo.jpg",
      'text2': "UA 1h 15m",
      'text3':
          "U.S. Marine Sgt. Logan Thibault (Zac Efron) returns home from his third tour of duty in Iraq with the one thing he believes kept him alive: a photograph of a woman he doesn't even know. He learns the woman's name is Beth (Taylor Schilling) and goes to meet her, eventually taking a job at her family-run kennel. Though Beth is full of mistrust and leads a complicated life, a romance blooms, giving Logan hope that Beth could become more than just his good-luck charm.",
    },
    {
      'text1': "THE FAULT IN OUR STARS",
      'TEXT': "images/tfios.jpg",
      'text2': "UA 1h 55m",
      'text3':
          "Hazel Grace Lancaster (Shailene Woodley), a 16-year-old cancer patient, meets and falls in love with Gus Waters (Ansel Elgort), a similarly afflicted teen from her cancer support group. Hazel feels that Gus really understands her. They both share the same acerbic wit and a love of books, especially Grace's touchstone, An Imperial Affliction by Peter Van Houten. When Gus scores an invitation to meet the reclusive author, he and Hazel embark on the adventure of their brief lives.",
    },
    {
      'text1': "THE DARK KNIGT RISES",
      'TEXT': "images/dk1.jpg",
      'text2': "UA 1h 55m",
      'text3':
          "It has been eight years since Batman (Christian Bale), in collusion with Commissioner Gordon (Gary Oldman), vanished into the night. Assuming responsibility for the death of Harvey Dent, Batman sacrificed everything for what he and Gordon hoped would be the greater good. However, the arrival of a cunning cat burglar (Anne Hathaway) and a merciless terrorist named Bane (Tom Hardy) force Batman out of exile and into a battle he may not be able to win."
    }
  ];

  var a = 0;
  Secondscreen({required this.a});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${mlist[a]['text1']}",
                        style: const TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Image.asset("${mlist[a]['TEXT']}"),
                    Text("${mlist[a]['text3']} ",
                        style: const TextStyle(
                            color: Colors.yellowAccent, fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite),
                        Icon(Icons.share),
                        Icon(Icons.message_outlined)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
