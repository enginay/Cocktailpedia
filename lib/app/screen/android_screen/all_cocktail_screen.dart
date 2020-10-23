import 'package:flutter/material.dart';
import '../../../services/cocktail_services.dart';
import '../../../model/cocktail.dart';
import 'dart:convert';
import '../../widgets/AndroidWidgets/cocktailItem.dart';

class AllCocktailScreen extends StatefulWidget {
  static const String route = '/allCocktails';
  AllCocktailScreen({Key key}) : super(key: key);

  @override
  _AllCocktailScreenState createState() => _AllCocktailScreenState();
}

class _AllCocktailScreenState extends State<AllCocktailScreen> {
  List<Cocktail> cocktails = [];

  void getCocktails() async {
    //final response = await getAllCocktails();
    await getAllCocktails().then((value) {
      setState(() {
        Iterable data = json.decode(value.body)['drinks'];
        cocktails = data.map((e) => Cocktail.fromJson(e)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCocktails();
  }

  @override
  Widget build(BuildContext context) {
    print(cocktails.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Cocktails'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [Colors.blue,Colors.purple,])),
        child: ListView.builder(
          itemCount: cocktails.length,
          itemBuilder: (BuildContext context, int index) {
            return CocktailItem(
                cocktailName: cocktails[index].name,
                imageUrl: cocktails[index].imageUrl,
                description: cocktails[index].description);
          },
        ),
      ),
    );
  }
}
