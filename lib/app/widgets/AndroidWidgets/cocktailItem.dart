import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../screen/android_screen/cocktail_detail_screnn.dart';

class CocktailItem extends StatelessWidget {
  final String cocktailName;
  final String imageUrl;
  final String description;
  final Map<String, String> zutatenByMenge;
  CocktailItem(
      {@required this.cocktailName,
      @required this.imageUrl,
      @required this.description,
      @required this.zutatenByMenge});
  void navigateToDetailPage(BuildContext context) {
    Navigator.pushNamed(context, CocktailDetailView.route, arguments: {
      "cocktailName": this.cocktailName,
      "description": this.description,
      "img": this.imageUrl,
      "zubereitung": this.zutatenByMenge
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.navigateToDetailPage(context),
      child: Container(
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Image.network(this.imageUrl),
            Positioned(
                child: Card(
              child: Text(this.cocktailName),
            ))
          ],
        ),
      ),
    );
  }
}
