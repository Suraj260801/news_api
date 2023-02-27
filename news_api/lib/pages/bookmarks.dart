import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_api/utils/news_tile.dart';

import '../models/news_model.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({Key? key}) : super(key: key);

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  ValueNotifier<List<Article>> bookMarkedArticles=ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    List<Article> articles =
        ModalRoute.of(context)!.settings.arguments as List<Article>;

    for (int i = 0; i < articles.length; i++) {
      if (articles[i].isBookMarked == true) {
        bookMarkedArticles.value.add(articles[i]);
      }
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Bookmarks'),
        actions: [
          IconButton(
              onPressed: () {
                List<Article> temp=bookMarkedArticles.value;
                for(int i=0;i<temp.length;i++){
                  if(temp[i].isBookMarked==false){
                    bookMarkedArticles.value.remove(temp[i]);
                  }
                }
              },
              icon: const Icon(Icons.refresh)
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: bookMarkedArticles,
        builder: (context,value,child){
          log('Called');
          return ListView.separated(
              itemBuilder: (context, index) {
                return NewsTile(article: bookMarkedArticles.value[index]);
              },
              separatorBuilder: (context, index) => const Divider(
                height: 0,
              ),
              itemCount: bookMarkedArticles.value.length);
        },

      ),
    );
  }
}
