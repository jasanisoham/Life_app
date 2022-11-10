import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../global.dart';
import '../modals/quot.dart';

class QuotesAPI {
  QuotesAPI._();

  static QuotesAPI quotesAPI = QuotesAPI._();

  Future<List<Quot>?> fetchQuotes({required tableName}) async {
    http.Response res = await http.get(
      Uri.parse((Global.isAuthor)
          ? "https://api.quotable.io/quotes/?author=$tableName"
          : "https://api.quotable.io/quotes/?tags=${(tableName == "Latest") ? "famous-quotes" : tableName}"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      List results = data["results"];
      List<Uint8List> images = [];

      for (int i = 0; i < results.length; i++) {
        http.Response image = await http.get(Uri.parse(
            "https://source.unsplash.com/random/${i + 1}?background,${(tableName == "Latest" || Global.isAuthor) ? "nature" : tableName} ,dark"));

        if (image.statusCode == 200) {
          images.add(image.bodyBytes);
        }
      }

      List<Quot> quotesList = results
          .map((e) => Quot.fromJSON(e, images[results.indexOf(e)]))
          .toList();

      return quotesList;
    }

    return null;
  }
}
