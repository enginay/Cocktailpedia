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
            decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, 
            end: Alignment.bottomCenter, 
            colors: [Colors.blue,Colors.purple,])),
          child: Center(child: Text(args["description"] != null? args["description"] : "No Description Available"),),      
      ),
    );
  }
}