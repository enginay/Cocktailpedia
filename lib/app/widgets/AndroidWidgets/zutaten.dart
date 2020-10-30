import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Zutaten extends StatelessWidget {
  final Map<String, String> zuatenByMenge;
  Zutaten({@required this.zuatenByMenge});
  @override
  Widget build(BuildContext context) {
    List<TextSpan> texte = [];
    this.zuatenByMenge.forEach((key, value) {
      texte.add(TextSpan(
          text: "$key : $value \n",
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 22.0,
          )));
    });
    return Container(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Zubereitung \n',
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 30.0,
            ),
            children: <TextSpan>[
              TextSpan(text: " "),
              TextSpan(text: " "),
              ...texte
            ]),
      ),
    );
  }
}
