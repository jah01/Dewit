import 'package:dewitapp/colors.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:toast/toast.dart';



//final ThemeData DarkTheme = new ThemeData(
//    brightness: Brightness.light,
//    primaryColorBrightness: Brightness.light,
//    accentColor: CustomColors.custom,
//    accentColorBrightness: Brightness.light
//);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new FirstScreen());
  }
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: DewitColors.background,
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
//                        MaterialPageRoute(builder: (context) => SecondScreen()));
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
              //TODO all other things on this page belong here and only here-- do not mess up the search bar

                child: ListView.builder(
                    //padding: const EdgeInsets.all(0),
                    itemCount: _tasks.length,
                    itemBuilder: (BuildContext context, int counter) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        decoration: new BoxDecoration(
                          //might need this later just to test colors
                            //color: Colors.amber[colorCodes[index]],
                            borderRadius: new BorderRadius.all(
                              Radius.circular(4.0),
                            )
                        ),
                        child: Hero(
                          tag: "task${_tasks.elementAt(counter).index.toString()}",
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ThirdScreen("task${_tasks.elementAt(counter).index.toString()}"))
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: ListTile(
                              //leading: Icon(Icons.ac_unit),
                              title: Text(
                                "Entry ${_tasks.elementAt(counter).index.toString()}",
                                style: TextStyle(
                                  color: DewitColors.lightGray,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                "just a test\ntesting",
                                style: TextStyle(
                                  color: DewitColors.darkGray,
                                  fontSize: 16,
                                ),
                              ),
                              isThreeLine: true,
                              //trailing: Icon(Icons.access_alarm),
                            ),
                          ),
                        ),
                      );
                    }
                ),

            ),
          ),
          //TODO any other children go BEFORE this (the bottom bar is right below)
          Container(
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
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => SecondScreen())
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
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
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
    );
  }
}


//TODO these will be created later
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];


//TODO THIS WILL BE A PART OF THE FINAL PRODUCT (NEED BACKEND HELP)-- REGARDLESS, THIS IS A GOOD STARTING POINT
class Tasks {
  final int index;
  //final List<int> colorCodes;
  Tasks(this.index);
}


List<Tasks> _tasks = [Tasks(1), Tasks(2), Tasks(3)];


class Select {
  const Select({this.title, this.icon});

  final String title;
  final IconData icon;
}


const List<Select> selection = const <Select>[
  const Select(title: "Extra1", icon: Icons.search),
  const Select(title: "Extra2", icon: Icons.search),
];


class SecondScreen extends StatelessWidget {
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


class ThirdScreen extends StatelessWidget {
  final String _selectedTask;
  ThirdScreen(this._selectedTask);

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
            color: DewitColors.darkGray,
            child: SafeArea(
              top: true,
              bottom: true,
              //alignment: FractionalOffset(0.5, 0),
              child: Hero(
                //tag: "task${entries[index]}",
                tag: _selectedTask,
                child: Container(
                  color: DewitColors.lightGray,
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
  runApp(MyApp());
}
