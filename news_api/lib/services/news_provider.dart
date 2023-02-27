import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/news_model.dart';
import '../services/news_services.dart';

class NewsProvider extends ChangeNotifier{
  final _services=ProductsServices();
  bool isLoading=false;
  late List<Article> articles;

  List<Article> get getNews =>articles;

  ///provider is used to perform background processing data received form
  ///API and to avoid mixing of backend code with ui code._services object
  ///is used to get response from API.isLoading is a variable that keeps on
  ///rotating until app receives data.notifyListeners method notifies listener
  ///homepage when there is an update in any of the value in provide class.
  Future<void> getAllProducts() async {
    isLoading=true;
    notifyListeners();
    final response= await _services.getAll() ;
    articles=response;
    isLoading=false;
    notifyListeners();

  }

}