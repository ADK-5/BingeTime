import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  modified_text({Key? key, required this.text, this.color, this.size, this.bgcolor,}) : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: GoogleFonts.breeSerif(
      color: color,fontSize: size,
      backgroundColor: bgcolor,
    ),);
  }
}
