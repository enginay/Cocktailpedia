import 'dart:convert';

import 'package:cocktail/app/widgets/AndroidWidgets/cocktailItem.dart';
import 'package:cocktail/model/cocktail.dart';
import 'package:cocktail/services/cocktail_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/AndroidWidgets/cocktailsearch.dart';


class CocktailSearchView extends StatefulWidget{
  static const String route = '/search';

  @override
  _CocktailSearchViewState createState() => _CocktailSearchViewState();
  }

class _CocktailSearchViewState extends State<CocktailSearchView> {

  var _searchEdit = new TextEditingController();

  bool _isSearch = true;
  String _searchText = "";


CocktailItem cocktailItem;


  void getCocktailFromUserInput(String userInput) async {
    final res = await searchCocktail(userInput);

    
    if(userInput.contains(res.CocktailItem)){
      return getCocktailFromUserInput(userInput);
    }else{
      throw Exception('This Cocktail doesnt exist');
    }
    /**
     * 
     * 1 ist die eingabe Valide 
     */
  }


  @override
  void initState() {
    super.initState();
    
  }

  _CocktailSearchViewState(){
    _searchEdit.addListener(() {
      if(_searchEdit.text.isEmpty){
        setState((){
          _isSearch = true;
          _searchText = "";
        });
      }else{
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }
  
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search List"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            
            _searchBox(),
            //_isSearch ? CoccktailItem : CocktailItem;
          ],
        ),
      ),
    );
  }

    Widget _searchBox() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0), color: Colors.grey),
        child: new TextField(
        onChanged: (userInput) => getCocktailFromUserInput(userInput),
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.black),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

 
  
  




    
}



