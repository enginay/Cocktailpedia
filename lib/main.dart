
import 'dart:io';
import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';
import './widgets/AndroidWidgets/mainView.dart';
import './widgets/IosWidgets/mainView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool osCheck = Platform.isIOS;
  @override
  Widget build(BuildContext context) {
    print(osCheck);
    return osCheck? CupertinoApp(
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
    );
  }
}


