import 'dart:collection';
import 'dart:io';
import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'package:toast/toast.dart';


void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
    initialRoute: "/",
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      //'/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      "/second": (context) => SecondScreen(),
    },
  ));
}


class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreen createState() {
    return _FirstScreen();
  }
}


class _FirstScreen extends State<FirstScreen> {
  //TODO this will be redone once backend is developed
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DewitColors.background,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: DewitColors.coalBlack,
        iconTheme: new IconThemeData(color: DewitColors.lightGray),
        title: const Text("Dewit",
            style: TextStyle(
              color: DewitColors.lightGray,
            )),
        actions: <Widget>[
          // action button
          Builder(
            builder: (BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
              //TODO all other things on this page belong here and only here-- do not mess up the search bar
              child: ListView.separated(
                //padding: const EdgeInsets.all(6.0),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0, bottom: 2.0),
                            child: Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: DewitColors.darkPurple,
                              ),
                            ),
                          )
                      ),
                      Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("$item dismissed"),
                              action: SnackBarAction(
                                label: "UNDO",
                                onPressed: () =>
                                    setState(() => items.insert(index, item)),
                              )
                          ));
                        },
                        background: Container(color: DewitColors.darkPurple),
                        child: Hero(
                          tag:
                          "task${items.elementAt(index)}",
                          child: Container(
                            margin: EdgeInsets.only(left: 4.0, right: 4.0),
                            decoration: new BoxDecoration(
                              //color: DewitColors.veryDarkPurple,
                              //might need this later just to test colors
                              //color: Colors.amber[colorCodes[index]],
                              borderRadius: new BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ThirdScreen(
                                                "task${items.elementAt(
                                                    index)}")));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.only(
                                    left: 16.0, right: 16.0),
//                                  leading: Container(
//                                    padding: EdgeInsets.all(0.0),
//                                    child: Icon(
//                                      Icons.check_box_outline_blank,
//                                      color: DewitColors.darkGray,
//                                      size: 24.0,
//                                    ),
//                                  ),
                                title: Text(
                                  "${items.elementAt(index)}",
                                  style: TextStyle(
                                    color: DewitColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  "just a test\ntesting",
                                  style: TextStyle(
                                    color: DewitColors.darkGray,
                                    fontSize: 12,
                                  ),
                                ),
                                isThreeLine: true,
                                //trailing: Icon(Icons.access_alarm),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: DewitColors.coalBlack,
                    height: 10,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  );
                },
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
                        )),
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
                                            borderRadius:
                                            new BorderRadius.all(
                                              Radius.circular(4.0),
                                            )),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(4.0),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/second');
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //padding: EdgeInsets.all(10.0),
                                                child:
                                                Text("Add something!",
                                                    style: TextStyle(
                                                      color: DewitColors
                                                          .iconColor,
                                                      fontSize: 18.0,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                                Spacer(),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: new BoxDecoration(
                                          color: DewitColors.lightPurple,
                                          borderRadius:
                                          new BorderRadius.all(
                                            Radius.circular(4.0),
                                          )),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(4.0),
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
                    )),
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
//        ),
//      ),
    );
  }
}


//TODO THIS WILL BE A PART OF THE FINAL PRODUCT (NEED BACKEND HELP)-- REGARDLESS, THIS IS A GOOD STARTING POINT
class Tasks {
  final int index;
  final String goal;
  //final List<int> colorCodes;
  Tasks(this.index, this.goal);

//  List<Tasks> populateTasks() {
//    List<Tasks> _tasks;
//
//    for (int i = 0; i < 20; i++) {
//      _tasks.add(Tasks(i, "goal $i"));
//    }
//    return _tasks;
//  }
}


//List<Tasks> _tasks = [Tasks(1, "goal 1"), Tasks(2, "goal 2"), Tasks(3, "goal 3")];

List<Tasks> populateTasks() {
  List<Tasks> _tasks = new List(20);
  _tasks[0] = Tasks(0, "buy a new dishwasher");
  _tasks[1] = Tasks(1, "insurance bill");
  _tasks[2] = Tasks(2, "gift for Mom");
  _tasks[3] = Tasks(3, "drop off sister");
  _tasks[4] = Tasks(4, "review essay");
  _tasks[5] = Tasks(5, "get gas before Thursday");
  _tasks[6] = Tasks(6, "pick up milk and eggs");


  for (int i = 7; i < 20; i++) {
    _tasks[i] = Tasks(i, "goal $i");
  }
  return _tasks;
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


class SecondScreen extends StatefulWidget {
  @override
  _SecondScreen createState() => _SecondScreen();
}


class _SecondScreen extends State<SecondScreen> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: "Discard task",
          child: IconButton(
            icon:Icon(Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
//            showDialog(
//              context: context,
//              builder: (_) => AlertDialog(
//                title: Text("Delete Task"),
//                content: Text("Are you sure you want to delete this task?"),
//                actions: <Widget>[
//                  FlatButton(
//                      child: Text("No"),
//                    onPressed: () {Navigator.pop(context);},
//                  ),
//                  FlatButton(
//                      child: Text("Yes"),
//                    onPressed: () {
//                        Navigator.pop(context);
//                        Navigator.pop(context);
//                    },
//                  ),
//                ],
//                elevation: 16,
//              ),
//              barrierDismissible: false,
//            );
            },
          ),
        ),
        title: Text("Add a task!"),
        backgroundColor: DewitColors.darkPurple,
        actions: <Widget>[
          Tooltip(
            message: "Add task",
            child: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {
                if (titleController.text.length == 0) {
//                  Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text("You must add something first")));
                //TODO change this up later
                  Toast.show("You must add something first", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                } else {
                  //TODO add the data to the
                  print("Title: " + titleController.text);
                  print("Optional Notes: " + noteController.text);
                  //check this
                  //Navigator.pushNamed(context, "/");
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
//            width: double.infinity,
//            height: double.infinity,
//            color: DewitColors.darkPurple,
            child: Hero(
                tag: "addSomething",
                child: Container(
                  color: DewitColors.lightPurple,
                  width: double.infinity,
                  height: double.infinity,
                ),
            ),
          ),
          Container(
            //margin: EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 4.0),
                  child: TextField(
                    controller: titleController,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    autofocus: true,
                    showCursor: true,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your task...",
                      counterText: '',
                      counterStyle: TextStyle(fontSize: 0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: TextField(
                      controller: noteController,
                      maxLength: 200,
                      maxLengthEnforced: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      autofocus: true,
                      showCursor: true,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Any short notes?",
                        counterText: '',
                        counterStyle: TextStyle(fontSize: 0),
                      ),
                    ),
                  ),
                )
              ],
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
            color: DewitColors.background,
            child: SafeArea(
              top: true,
              bottom: true,
              //alignment: FractionalOffset(0.5, 0),
              child: Hero(
                //tag: "task${entries[index]}",
                tag: _selectedTask,
                child: Container(
                  color: DewitColors.background,
                  width: double.infinity,
                  height: double.infinity,
                ),
                //margin: const EdgeInsets.all(6.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class TasksTest {
  final String title;
  final String note;

  TasksTest(this.title, this.note);
}
