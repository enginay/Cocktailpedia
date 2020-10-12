import 'package:flutter/foundation.dart';

class Cocktail{
  final int cocktailId;
  final String name; 
  final String imageUrl;
  Cocktail({@required this.cocktailId, @required this.name, @required this.imageUrl});
  factory Cocktail.fromJson(Map<String, dynamic> json){
    return Cocktail(cocktailId: json['drinks']['idDrink'], name: json['drinks']['strDrink'], imageUrl: json['drinks']['strDrinkThumb']);
  }
}