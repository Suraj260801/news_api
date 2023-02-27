import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';
import '../services/news_provider.dart';
import '../utils/custom_search_delegate.dart';
import '../utils/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(articles: articles),
                );
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton(
              tooltip: "See BoolMarkes Here",
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Navigator.pushNamed(context, '/bookMarks',
                              arguments: articles);
                        });
                      },
                      child: const Text(
                        'Bookmarks',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Navigator.pushNamed(context, '/bookMarks');
                        });
                      },
                      child: const Text('Settings'),
                    )
                  ]),
        ],
        title: const Text('News'),
      ),
      body: Consumer<NewsProvider>(builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          articles = value.articles;
          return ListView.separated(
              itemBuilder: (context, index) => NewsTile(
                    article: value.getNews[index],
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
              itemCount: value.getNews.length);
        }
      }),
    );
  }
}
