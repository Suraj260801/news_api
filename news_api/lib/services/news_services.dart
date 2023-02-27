import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class ProductsServices {
  Future<List<Article>> getAll() async {
    final client = http.Client();
    const String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-01-27&sortBy=publishedAt&apiKey=e65772a7e4094e5eb3d20d638f30c25e';

    final Uri uri = Uri.parse(url);
    final response = await client.get(uri);

    ///get method of Client accepts uri hence it is parsed from string to uri using parse method of Uri class.
    ///statusCode 200 indicates that everything is ok and response is received successfully.If the statusCode is
    ///other than 200 we return null.
    ///The compute method is used to create another thread responsible for json parsing which is a
    ///synchronous work can affect performance of the application.
    if (response.statusCode == 200) {
      final NewsModel data =
          await compute(newsModelFromJson, response.body.toString());
      List<Article> articles = data.articles;
      log(articles.toString());
      articles.map((article) {
        if (article.urlToImage == null || article.author == null) {
          articles.remove(article);
        }
        try {
          Uri.parse(article.urlToImage!);
        } on FormatException {
          articles.remove(article);
        }
      });
      return articles;
    }
    return [];
  }
}
