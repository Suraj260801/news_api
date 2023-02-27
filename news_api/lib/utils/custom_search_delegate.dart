import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/utils/news_tile.dart';

class CustomSearchDelegate extends SearchDelegate{
  late List<Article> articles;

  CustomSearchDelegate({required this.articles});


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Article> matchQuery = [];
    int item;
    for (item = 0; item < articles.length; item++) {
      if (articles[item].title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(articles[item]);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
         return NewsTile(article: result);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Article> matchQuery = [];
    int item;
    for (item = 0; item < articles.length; item++) {
      if (articles[item].title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(articles[item]);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
        return NewsTile(article: result);
        });
  }
}
