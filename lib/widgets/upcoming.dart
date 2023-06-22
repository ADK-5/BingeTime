import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class UpcomingMovies extends StatelessWidget {
   UpcomingMovies({Key? key, required this.moviesList}) : super(key: key);
   String baseImageURL='https://image.tmdb.org/t/p/w500';

   final List moviesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           modified_text(
            text: "Upcoming Movies",
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moviesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Description(
                              name: moviesList[index]['title'] ??
                                  moviesList[index]['name'],
                              description: moviesList[index]['overview'],
                              bannerurl: '$baseImageURL${moviesList[index]['backdrop_path']}',
                              posterurl: '$baseImageURL${moviesList[index]['poster_path']}',
                              vote: '${moviesList[index]['vote_average']}',
                              launched: '${moviesList[index]['first_air_date']}')));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '$baseImageURL${moviesList[index]['poster_path']}'))),
                          ),
                          Container(child: modified_text(text: moviesList[index]['title']??'',size: 15,),)
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
