import 'package:flutter/material.dart';
import '../../screen/android_screen/cocktail_search_screnn.dart';

class CocktaiSearch extends StatelessWidget {
  void navigateToSearchPage(BuildContext context) {
    Navigator.pushNamed(context, CocktailSearchView.route);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => this.navigateToSearchPage(context),
        child: Container(
          margin: EdgeInsets.all(5),
        ));
  }
}
