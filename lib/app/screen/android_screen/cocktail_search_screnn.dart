import 'dart:convert';

import 'package:cocktail/app/widgets/AndroidWidgets/cocktailItem.dart';
import 'package:cocktail/model/cocktail.dart';
import 'package:cocktail/services/cocktail_services.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class CocktailSearchView extends StatefulWidget{
  static const String route = '/search';
  //  CocktailSearchView({Key key}) : super(key: key);

  @override
  _CocktailSearchViewState createState() => _CocktailSearchViewState();

  }


class _CocktailSearchViewState extends State<CocktailSearchView> {

Future <List<Cocktail>> _searchResult = [] as Future<List<Cocktail>>;
List<Cocktail> _cocktail = [];

void getCocktails() async{
  await searchCocktail("").then((value){
    setState((){
      Iterable data = json.decode(value.body)['drinks'];
      _searchResult = data.map((e) => Cocktail.fromJson(e)) as Future<List<Cocktail>>;
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
   
    return Scaffold(
          appBar: AppBar(
            title: Text("Search Cocktail"),
          ),
          body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(onSearch: (cocktail) { 
            return _searchResult;
           }, onItemFound: (Cocktail item, int index) {
             return CocktailItem(cocktailName: "cocktail", 
             description: "slk", imageUrl: null,);
             
               
           },
          )
          ,)
          ,),
          
    );
  }
    
}



