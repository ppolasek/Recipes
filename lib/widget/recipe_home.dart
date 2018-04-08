
import 'package:flutter/material.dart';
import 'recipe_strings.dart';

class RecipeHome extends StatefulWidget {
  RecipeHome({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  RecipeHomeState createState() => new RecipeHomeState();
}

class RecipeHomeState extends State<RecipeHome> {
//  int _counter = 0;

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that
//      // something has changed in this State, which causes it to rerun
//      // the build method below so that the display can reflect the
//      // updated values. If we changed _counter without calling
//      // setState(), then the build method would not be called again,
//      // and so nothing would appear to happen.
//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      floatingActionButton: _buildAddRecipeFAB(),
      body: new Center( // TODO need a real 'body' of the home page
        child: new Text('1'),
//          'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
//        ),
      ), // This trailing comma tells the Dart formatter to use a style that looks nicer for build methods.
    );
  }

  Widget _buildAppBar() {
    return new AppBar(
        elevation: 0,
        title: new Text(RecipeStrings.of(context).RecipeStrings_title()),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: null, // TODO need a search mechanism _handleSearchBegin
              tooltip: 'Search'
          )
        ]);
  }

  Widget _buildAddRecipeFAB() {
    return new FloatingActionButton(
      onPressed: null, // TODO open window (from bottom?) to add a new favorite recipe
      tooltip: 'Add recipe',
      child: new Icon(Icons.add),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle = themeData.textTheme.body2.copyWith(color: themeData.accentColor);
    final TextStyle titleStyle = themeData.textTheme.title;

    final Widget aboutItem = new AboutDrawerItem(
        icon: new Image.asset("gallery/logo_icon_24.jpeg", fit: ImageFit.contain),
        applicationVersion: '2017.0.0.1',
//        applicationIcon: new RecipeLogo(),
//        applicationIcon: new Image.asset("gallery/cover.jpg", fit: ImageFit.scaleDown),
        // TODO this should be an icon, not a full-sized image
        applicationIcon: new Card(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: new Stack(
                          children: <Widget>[
                            new Positioned.fill(
                                child: new Image.asset(
                                    "gallery/cover.jpg",
                                    fit: ImageFit.cover
                                )
                            ),
                            new Positioned(
                              bottom: 16.0,
                              left: 16.0,
                              right: 16.0,
                              child: new FittedBox(
                                fit: ImageFit.scaleDown,
                                alignment: FractionalOffset.centerLeft,
                                child: new Text("me",
                                  style: titleStyle,
                                ),
                              ),
                            ),
                          ]
                      )
                  ),
                ])),
        applicationLegalese: '© 2017 Philip Polasek',
        aboutBoxChildren: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: new RichText(
                  text: new TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                            style: aboutTextStyle,
                            text: "My Favorite Recipes was created to store "
                                  "references to your favorite recipes in various "
                                  "cookbooks and websites."
                        )
                      ]
                  )
              )
          )
        ]
    );


    // Store all of your favorite recipes and where you found them:
    // o  which cookbook and the page number
    // o  Or the URL to the website
    //
    // Notes for each recipe, like how you used different ingredients, or how much
    // Star your favorite recipes!
    // Rate the 'true' effort level to prepare the ingredients and cook the meal
    //   and the time it took from prep work to completion!
    // TODO for the drawer header, show more verbiage about what the app is & does
    // TODO this should be an image and the app title. Move the verbiage below to the 'about' box

//                          new TextSpan(
//                              style: titleStyle,
//                              text: RecipeStrings.of(context).RecipeStrings_title()
//                          ),

//                              text: "\n\nStore references to your favorite recipes and where you found them"
//                                  "\n o  which cookbook and the page number"
//                                  "\n o  Or the URL to the website"
//                                  "\n\n o Notes for each recipe, like how you used different ingredients, or how much!"
//                                  "\n Star your favorite recipes!"
//                                  "\n Rate the 'true' effort level to prepare the ingredients and cook the meal"
//                                  "and the time it took from prep work to completion!"

    return new Drawer(
        child: new Block(children: <Widget>[
          new DrawerHeader(
              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new RichText(
                     text: new TextSpan(
                           children: <TextSpan>[
                                new TextSpan(
                                    style: titleStyle,
                                    text: RecipeStrings.of(context).RecipeStrings_title()
                                ),
                             // TODO show the cover.jpg image
//                                new TextSpan(
//                                    style: aboutTextStyle,
//                                    text: "\n\nStore references to your favorite recipes and where you found them"
//                                ),
                           ]),
              ),
          ),
          new DrawerItem(
              icon: new Icon(Icons.history),
              onPressed: null, //_handleShowHistory,
              child: new Text('Recipe browsing history')),
          new Divider(),
          new DrawerItem(
              icon: new Icon(Icons.settings),
              onPressed: _handleShowSettings,
              child: new Text('Settings')),
          aboutItem
//          new DrawerItem(
//              icon: new Icon(Icons.help),
//              onPressed: _handleShowAbout,
//              child: new Text('About'))
        ])
    );
  }

  void _handleShowSettings() {
    Navigator.popAndPushNamed(context, '/settings');
  }

  void _handleShowAbout() {
    // TODO show a custom dialog
    showAboutDialog(context: context);
  }
}
