import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String description;
  Description({@required this.description});
  @override
  Widget build(BuildContext context) {
    bool check = this.description == null ? true : false;
    return Column(children: [
      Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        padding: check ? EdgeInsets.all(45) : EdgeInsets.all(25),
        child: Text(
          check ? "Description nicht verfügbar" : this.description,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: check ? 22 : 17.0,
          ),
        ),
      ),
    ]);
  }
}
