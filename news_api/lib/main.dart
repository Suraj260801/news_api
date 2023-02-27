import 'package:flutter/material.dart';
import 'package:news_api/services/news_provider.dart';
import 'package:news_api/utils/constants.dart';
import 'package:news_api/utils/custom_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //static const pageTransitionType = PageTransitionType.rightToLeft;
  final myTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
    pageTransitionsTheme:  const PageTransitionsTheme(
      builders: {
        TargetPlatform.android:ZoomPageTransitionsBuilder()
      }
    ),
    // Other theme properties...
  );
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        initialRoute: Constants.splashScreen,
        onGenerateRoute: CustomRoute.generateRoute,
        debugShowCheckedModeBanner: false,
        theme:myTheme
      ),
    );
  }
}
