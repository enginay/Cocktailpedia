import 'package:flutter/foundation.dart';

class Cocktail {
  final String cocktailId;
  final String name;
  final String imageUrl;
  final String description;
  Cocktail(
      {@required this.cocktailId,
      @required this.name,
      @required this.imageUrl,
      @required this.description});
  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
        cocktailId: json['idDrink'],
        name: json['strDrink'],
        imageUrl: json['strDrinkThumb'],
        description: json['strInstructionsDE']);
  }
}
