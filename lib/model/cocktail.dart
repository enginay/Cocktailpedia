import 'package:flutter/foundation.dart';

class Cocktail {
  final String cocktailId;
  final String name;
  final String imageUrl;
  final String description;
  final Map<String, String> zutatenByMenge;
  Cocktail(
      {@required this.cocktailId,
      @required this.name,
      @required this.imageUrl,
      @required this.description,
      @required this.zutatenByMenge});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    final Map<String, String> zutatenByMenge = new Map<String, String>();
    int numberOfMaxZutatenAndMenge = 1;
    String zutaten = "strIngredient";
    String menge = "strMeasure";
    while (true) {
      if (json["$zutaten$numberOfMaxZutatenAndMenge"] != null &&
          json["$menge$numberOfMaxZutatenAndMenge"] != null) {
        zutatenByMenge[json["$zutaten$numberOfMaxZutatenAndMenge"]] =
            json["$menge$numberOfMaxZutatenAndMenge"];
        numberOfMaxZutatenAndMenge++;
      } else {
        break;
      }
    }
    return Cocktail(
        cocktailId: json['idDrink'],
        name: json['strDrink'],
        imageUrl: json['strDrinkThumb'],
        description: json['strInstructionsDE'],
        zutatenByMenge: zutatenByMenge);
  }
}
