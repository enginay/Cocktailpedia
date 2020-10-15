
import 'dart:io';
import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';
import 'app/widgets/AndroidWidgets/main_view.dart';
import 'app/widgets/IosWidgets/main_view.dart';
import './app/screen/android_screen/all_cocktail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool osCheck = Platform.isIOS;
  @override
  Widget build(BuildContext context) {
    return !osCheck? CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        brightness:Brightness.light,
      ),
      home: IosHomePage(),
    ) : MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cocktail Application'),
      routes:  {
        AllCocktailScreen.route: (context) => AllCocktailScreen(),
        
      },
    );
  }
}

