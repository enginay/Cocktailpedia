import 'package:flutter/material.dart';

class CocktailDetailView extends StatelessWidget {
  static const String route = "/cocktaildetail";
  @override
  Widget build(BuildContext context) {

    final dynamic args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
          appBar: AppBar(
            title: Text("Detail page ${args["cocktailName"]}"),
          ),
          body: Container(
          child: Center(child: Text("Hallo"),),      
      ),
    );
  }
}