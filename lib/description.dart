import 'package:flutter/material.dart';
import 'package:moviesapp/utils/text.dart';

class Description extends StatelessWidget {
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launched})
      : super(key: key);
  final String name, description, bannerurl, posterurl, vote, launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //padding: EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                        color: getColor(vote),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: modified_text(
                          text: 'Average Rating: ${roundDouble(vote)}',
                        ))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: modified_text(
              text: name,
              size: 24,
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(start: 10),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                  child: Container(
                    child: modified_text(
                  text: description,
                  size: 18,
                ),
              ))
            ],
          )
        ],
      )),
    );
  }
}

getColor(String s) {
  double n = double.parse(s);
  n = (n * 10).round() / 10;
  if (n >= 8.0)
    return Colors.green;
  else if (n >= 5.0) return Colors.deepOrange;
  return Colors.red;
}

double roundDouble(String s) {
  double n = double.parse(s);
  return ((n * 10).round() / 10);
}
