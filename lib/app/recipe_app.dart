
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:Recipes/my_favorite_recipes.dart';

class RecipeApp extends StatefulWidget {
  @override
  RecipeAppState createState() => new RecipeAppState();
}

class RecipeAppState extends State<RecipeApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Favorite Recipes',
      theme: new ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see
      // the application has a blue toolbar. Then, without quitting
      // the app, try changing the primarySwatch below to Colors.green
      // and press "r" in the console where you ran "flutter run".
      // We call this a "hot reload". Notice that the counter didn't
      // reset back to zero -- the application is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: new MyHomePage(title: 'My Favorite Recipes'),
      routes:
      <String, WidgetBuilder>{
        '/': (BuildContext context) => new RecipeHome()
        //, // TODO create the settings widget
//        '/settings': (BuildContext context) => new StockSettings(_configuration, configurationUpdater)
      },
      onGenerateRoute: _getRoute,
      onLocaleChanged: _onLocaleChanged,
    );
  }

  Future<LocaleQueryData> _onLocaleChanged(Locale locale) async {
    String localeString = locale.toString();
    await initializeMessages(localeString);
    Intl.defaultLocale = localeString;
    return RecipeStrings.instance;
  }

  Route<Null> _getRoute(RouteSettings settings) {
    print('_getRoute() settings = $settings');
    print('_getRoute() settings.name = ${settings?.name}');
    List<String> path = settings.name.split('/');
    if (path[0] != '')
      return null;
    if (path[1] == 'recipe') {
      if (path.length != 3)
        return null; // TODO finish this when settings is available
      //    if (_stocks.containsKey(path[2])) {
      //      return new MaterialPageRoute<Null>(
      //          settings: settings,
      //          builder: (BuildContext context) => new StockSymbolPage(stock: _stocks[path[2]])
      //      );
      //    }
    }
    return null;
  }
}
