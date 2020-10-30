import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../android_screen/../../widgets/AndroidWidgets/description.dart';
import '../android_screen/../../widgets/AndroidWidgets/zutaten.dart';

class CocktailDetailView extends StatelessWidget {
  static const String route = "/cocktaildetail";
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    String cocktailName = args['cocktailName'];
    String imgUrl = args['img'];
    String description = args['description'];
    Map<String, String> zutatenByMenge = args['zubereitung'];
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imgUrl), fit: BoxFit.cover)),
                ),
                title: Text(
                  cocktailName,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Description(description: description),
              Divider(
                height: 25,
                color: Colors.black,
                thickness: 0,
              ),
              Zutaten(zuatenByMenge: zutatenByMenge)
            ] as List<Widget>))
          ],
        ),
      ),
    );
  }
}
