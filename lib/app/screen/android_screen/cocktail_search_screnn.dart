import 'dart:convert';

import 'package:cocktail/app/widgets/AndroidWidgets/cocktailItem.dart';
import 'package:cocktail/services/cocktail_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CocktailSearchView extends StatefulWidget {
  static const String route = '/search';

  @override
  _CocktailSearchViewState createState() => _CocktailSearchViewState();
}

class _CocktailSearchViewState extends State<CocktailSearchView> {
  var _searchEdit = new TextEditingController();
  CocktailItem cocktailItem;
  FocusNode focuNode = new FocusNode();
  Container con;

  @override
  void initState() {
    focuNode.addListener(() {
      if (_searchEdit.value.text.isNotEmpty) {
        this.getCocktailFromUserInput(_searchEdit.value.text);
      }
    });
    super.initState();
    con = Container(child: Text("Nothing searched"));
  }

  void getCocktailFromUserInput(String userInput) async {
    final res = await searchCocktail(userInput);
    final dynamic data = json.decode(res.body)['drinks'][0];
    print(data);
    if (res.statusCode == 404) {
      con = Container(child: Text("Nothing searched"));
      return;
    }
    String description = data['strInstructionsDE'] == null
        ? "description not available"
        : data['strInstructionsDE'];
    setState(() {
      con = Container(
        child: CocktailItem(
            cocktailName: data['strDrink'],
            imageUrl: data['strDrinkThumb'],
            description: description),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search List"),
      ),
      body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [Colors.blue,Colors.purple,])),
              child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: TextField(
                        focusNode: this.focuNode,
                        controller: _searchEdit,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(90.0)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white,),
                          filled: false,
                          fillColor: Colors.white24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 25, right: 7, left: 7),
                  child: this.con)
            ]),
          ),
        ),
      ),
    );
  }
}
