import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cocktail/app/screen/android_screen/all_cocktail_screen.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(""),
              decoration: BoxDecoration(
                image:DecorationImage(
                  image:NetworkImage('https://cdn.pixabay.com/photo/2018/04/17/11/03/cocktail-3327242__340.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
           // DrawerHeader(padding: EdgeInsets.all(0.0),child: Expanded(child: Image.network('https://cdn.pixabay.com/photo/2018/04/17/11/03/cocktail-3327242__340.jpg',
           // fit: BoxFit.cover,))),
            ListTile(
              title: Text(
                'All Cocktails',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.local_bar, size: 40, color: Colors.white),
              onTap: () => Navigator.pushNamed(context, AllCocktailScreen.route) ,
            ),
            Divider(
              height: 25,
                              color: Colors.white,
                thickness: 1,
            ),
            ListTile(
              title: Text(
                'Search',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.search, size: 40,color: Colors.white),
            ),
            Divider(
              height: 25,
              color: Colors.white,
                thickness: 1,
            ),
            ListTile(
              title: Text(
                'Favorites',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.star_rate, size: 40, color: Colors.white),
            ),
            Divider(
                height: 25,
                color: Colors.white,
                thickness: 1,
            ),
            ListTile(
                title: Text(
                'Settings',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.settings, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
