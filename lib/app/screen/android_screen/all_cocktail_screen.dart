import 'package:flutter/material.dart';
import '../../../services/cocktail_services.dart';
import '../../../model/cocktail.dart';
import 'dart:convert';
import 'dart:io';

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
      body: ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Column(
            children: [
              Text('${cocktails[index].cocktailId}'),
              Text(cocktails[index].name)
            ],
          ));
        },
      ),
    );
  }
}
