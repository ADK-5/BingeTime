import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/utils/text.dart';
import 'package:moviesapp/widgets/popularTV.dart';
import 'package:moviesapp/widgets/trending.dart';
import 'package:moviesapp/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'auth.dart' as ath;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies = [];
  List upcomingMovies = [];
  List popularTV = [];
  final String apikey = '3655ee9c7ada9894390d9da7a47b4968';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNjU1ZWU5YzdhZGE5ODk0MzkwZDlkYTdhNDdiNDk2OCIsInN1YiI6IjYzYzI0YmZmYTU3NDNkMDA4OTEwYmJlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1U2UJzQ04DVyaD55ko9XikcU-ue31hJDGK916w4H9n0';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map upcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map popularTVResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingresult['results'];
      upcomingMovies = upcomingResult['results'];
      popularTV = popularTVResult['results'];
    });
    // if (kDebugMode) {
    //   print(trendingresult);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: modified_text(text: "Binge Time"),
        actions: [
          TextButton(
            onPressed: () {
              ath.Auth().signOut();
            },
            child: const Text(
              "Sign Out",
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: ListView(children: [
        TrendingMovies(moviesList: trendingMovies),
        UpcomingMovies(moviesList: upcomingMovies),
        PopularTVShows(moviesList: popularTV)
      ]),
    );
  }
}
