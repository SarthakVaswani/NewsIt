import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/model.dart';

class Services {
  static var client = http.Client();
  static Future<List<Article>> fetchNews() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=8100f2de1b32445b9d1495e6626f8345"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonString = jsonDecode(response.body);
      List<dynamic> body = jsonString['articles'];
      List<Article> article =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return article;
    } else {
      return null;
    }
  }
}
