import 'package:dewitapp/colors.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:toast/toast.dart';

//
////final ThemeData DarkTheme = new ThemeData(
////    brightness: Brightness.light,
////    primaryColorBrightness: Brightness.light,
////    accentColor: CustomColors.custom,
////    accentColorBrightness: Brightness.light
////);
//
//void main() {
//  runApp(MyApp());
//}
//

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new TopBar());
  }
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Dewit",
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primaryColor: DewitColors.coalBlack,
//        accentColor: DewitColors.darkPurple,
//        canvasColor: DewitColors.background,
//        //primarySwatch: DewitColors.darkPurple,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      //home: MyHomePage(title: 'Dewit'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        //title: Text(widget.title),
//        title: const Text("Dewit", style: TextStyle(
//            color: DewitColors.lightGray,
//        )),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//              style: TextStyle(color: DewitColors.lightPurple),
//            ),
//            Text(
//              '$_counter',
////              style: Theme.of(context).textTheme.headline4,
//              style: TextStyle(
//                  color: DewitColors.darkPurple,
//                  fontSize: 40,
//              ),
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

//HELP FROM: The Chromium Authors.
//at https://flutter.dev/docs/catalog/samples/basic-app-bar

// This app is a stateful, it tracks the user's current choice.
class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  Select _selectedChoice = selection[0]; // The app's "state".

  void _select(Select selection) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: DewitColors.coalBlack,
          iconTheme: new IconThemeData(color: DewitColors.lightGray),
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("SnackBar menu!"),
                    ));
                    //Toast.show("You selected menu!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  },
                );
              },
          ),
          title: const Text("Dewit",
              style: TextStyle(
                color: DewitColors.lightGray,
              )
          ),
          actions: <Widget>[
            // action button
            Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    //one or the other
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text("SnackBar search!"),
//                    ));
                  //TODO THIS IS IMPORTANT FOR LATER
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => SecondRoute()));
                    //Toast.show("You selected search!", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  },
                );
              },
            ),
            PopupMenuButton<Select>(
              itemBuilder: (BuildContext context) {
                return selection.skip(0).map((Select selection) {
                  return PopupMenuItem<Select>(
                    value: selection,
                    child: Text(selection.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          //padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Expanded(
              child: Align(
                  alignment: FractionalOffset(0.5, 1),
                  child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: 60.0,
                      margin: const EdgeInsets.all(6.0),
                      //padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: DewitColors.darkPurple,
                          borderRadius: new BorderRadius.all(
                            Radius.circular(4.0),
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          //TODO any other children go BEFORE this (the bottom bar is right below)
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              color: Colors.transparent,
                              //width: 300.0,
                              //margin: new EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 31,
                                    child: Hero(
                                      tag: "addSomething",
                                      child: Container(
                                        height: double.infinity,
                                        //child: Text("testing this out"),
                                        decoration: new BoxDecoration(
                                            color: DewitColors.lightPurple,
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(4.0),
                                            )
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => SecondRoute())
                                            );
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Add something!",
                                                  style: TextStyle(
                                                    color: DewitColors.iconColor,
                                                    fontSize: 16.0,
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),


                                    )
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: new BoxDecoration(
                                            color: DewitColors.lightPurple,
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(4.0),
                                            )
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            print("BIG MIC TEST");
                                          },
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.mic,
                                            color: DewitColors.iconColor,
                                            size: 24.0,
                                          ),
//                                            child: new Icon(
//                                              Icons.mic,
//                                              color: DewitColors.iconColor,
//                                              size: 24.0,
//                                            ),

//                                          child: Column(
//                                            children: <Widget>[
//                                              Container(
//                                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0),
//
//                                                child: Icon(
//                                                  Icons.mic,
//                                                  color: DewitColors.iconColor,
//                                                  size: 24.0,
//                                                ),
//                                              ),
//                                            ],
//                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Spacer(),
//                                  Expanded(
//                                    flex: 4,
//                                    child: GestureDetector(
//                                        onTap: () {
//                                          print("PIC CLICKED");
//                                        },
//                                      child: Container(
//                                        decoration: new BoxDecoration(
//                                            color: DewitColors.lightPurple,
//                                            borderRadius: new BorderRadius.all(
//                                              Radius.circular(4.0),
//                                            )
//                                        ),
//                                        child: Column(
//                                          children: <Widget>[
//                                            Container(
//                                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
//
//                                              child: Icon(
//                                                Icons.photo_camera,
//                                                color: DewitColors.iconColor,
//                                                size: 24.0,
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
//                        child: Text("TESTING",
//                          textAlign: TextAlign.center,
//                        ),
                  ),
              ),
            ),
//            Container(
//              //padding: EdgeInsets.all(20.0),
//              //margin: new EdgeInsets.all(20.0),
//              color: DewitColors.darkPurple,
//              child: Align(
//                alignment: FractionalOffset.bottomCenter,
//                child: Padding(
//                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
//                    child: Text("TESTING"),
//                )
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.all(30.0),
//              color: Colors.blue,
//              child: Text("ern"),
//            ),



          ],
        ),
        backgroundColor: DewitColors.background,
      ),
    );
  }
}

class Select {
  const Select({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Select> selection = const <Select>[
  const Select(title: "Extra1", icon: Icons.search),
  const Select(title: "Extra2", icon: Icons.search),
];




class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        //title: Text("Second Route"),
//        backgroundColor: DewitColors.lightPurple,
//      ),
        body: Stack(

        //padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: DewitColors.darkPurple,
              child: SafeArea(
                top: true,
                bottom: true,
                //alignment: FractionalOffset(0.5, 0),
                  child: Hero(
                    tag: "addSomething",
                    child: Container(
                      color: DewitColors.lightPurple,
                      width: double.infinity,
                      height: 60.0,
                    ),
                    //margin: const EdgeInsets.all(6.0),
                  ),
              ),
            ),
          ],
        ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
    );
  }
}




void main() {
  runApp(TopBar());
}
