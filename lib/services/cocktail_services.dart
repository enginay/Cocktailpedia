import 'package:http/http.dart' as http; 

//const String baseUrl = 'www.thecocktaildb.com/api/json/v1/1/';

Future getAllCocktails()async{
    //final uri = Uri.https(baseUrl, 'search.php?f=a');
    final response = await http.get('https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a');
    return response;
}