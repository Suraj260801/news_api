import 'package:flutter/material.dart';
import 'package:news_api/models/news_model.dart';
import 'package:news_api/pages/bookmarks.dart';
import 'package:news_api/pages/description.dart';
import 'package:news_api/utils/constants.dart';
import 'package:news_api/pages/splash_screen.dart';

import '../pages/home_page.dart';
class CustomRoute{
static Route<dynamic> generateRoute(RouteSettings settings){

  final dynamic args=settings.arguments;
  switch(settings.name){
    case Constants.splashScreen:
      return MaterialPageRoute(builder:(context)=> const SplashScreen(),);
    case Constants.homePage:
      return MaterialPageRoute(builder:(context)=> const HomePage());
    case Constants.description:
      return MaterialPageRoute(builder:(context)=> Description(article:args as Article),
      settings: RouteSettings(
        arguments: args
      ));
    case Constants.bookMarks:
      return MaterialPageRoute(builder: (context)=> const BookMarks(),

      settings: RouteSettings(
        arguments: args
      ));
    default:
      return _errorRoute();


  }
}
static Route<dynamic> _errorRoute(){
  return MaterialPageRoute(builder: (context)=>
      Scaffold(
        appBar: AppBar(title: const Text('Error'),),
      )
  );
}
}

