import 'dart:collection';
import 'dart:io';
import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'package:toast/toast.dart';
import 'package:auto_size_text/auto_size_text.dart';


//int size = 0;
List<Tasks> items = new List();


void main() {
  runApp(MaterialApp(
    home: FirstScreen(),
    initialRoute: "/",
    routes: {
      //'/': (context) => FirstScreen(),
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
  //final items = List<String>.generate(20, (i) => "Item ${i + 1}");
  //final items = new List(size);
  //items.getItems();

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
              child: Container(
//                margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                //TODO all other things on this page belong here and only here-- do not mess up the search bar
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    return Column(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0.0, left: 8.0, right: 8.0, bottom: 0.0),
//                            child: Text(
//                              "Today",
//                              style: TextStyle(
//                                fontSize: 28,
//                                fontWeight: FontWeight.bold,
//                                color: DewitColors.darkPurple,
//                              ),
//                            ),
                            )),
                        Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              items.removeAt(index);
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "\"" + "${item.title}" + "\" dismissed."),
                                action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    setState(() => items.insert(index, item));
                                  },
                                )));
                          },
                          //background: Container(color: DewitColors.darkPurple),
                          background: Container(
                            color: DewitColors.darkPurple,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              Icons.delete,
                              color: DewitColors.lightGray,
                            ),
                          ),
                          secondaryBackground: Container(
                            color: DewitColors.darkPurple,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(
                              Icons.delete,
                              color: DewitColors.lightGray,
                            ),
                          ),
                          child: Hero(
                            tag: index.toString(),
                            child: Container(
                              margin: EdgeInsets.only(left: 4.0, right: 4.0),
                              decoration: new BoxDecoration(
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
                                          builder: (context) => ThirdScreen(
                                              index.toString(), item)));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.only(left: 16.0, right: 16.0),
//                                  leading: Container(
//                                    padding: EdgeInsets.all(0.0),
//                                    child: Icon(
//                                      Icons.check_box_outline_blank,
//                                      color: DewitColors.darkGray,
//                                      size: 24.0,
//                                    ),
//                                  ),
                                  dense: false,
                                  title: Container(
                                    margin:
                                        EdgeInsets.only(top: 8.0, bottom: 8.0),
                                    child: AutoSizeText(
                                      "${item.title}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 20,
                                      style: TextStyle(
                                        color: DewitColors.lightGray,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //TODO make an if statement, make the cards less dense if desired
                                  subtitle: Container(
                                    margin:
                                        EdgeInsets.only(top: 0.0, bottom: 10.0),
                                    child: AutoSizeText(
                                      "${item.note}",
                                      style: TextStyle(
                                        color: DewitColors.darkGray,
                                        fontSize: 12,
                                      ),
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
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(4.0),
                                            )),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          onPressed: () {
//                                            Navigator.of(context)
//                                                .pushReplacementNamed(
//                                                    '/second');
                                            Navigator.pushNamed(context, '/second');
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //padding: EdgeInsets.all(10.0),
                                                child: Text("Add something!",
                                                    style: TextStyle(
                                                      color:
                                                          DewitColors.iconColor,
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
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(4.0),
                                          )),
                                      child: Tooltip(
                                        message: "Use voice",
                                        verticalOffset: 36,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          onPressed: () {
                                            //TODO this button must do something
                                          },
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.mic,
                                            color: DewitColors.iconColor,
                                            size: 24.0,
                                          ),
                                        ),
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
              //Navigator.popAndPushNamed(context, '/');
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
                  //TODO add the data to the list
                  //size++;
                  items.add(Tasks(titleController.text, noteController.text));

                  //check this
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/", (Route<dynamic> route) => false);
                  });
//                  Navigator.pushAndRemoveUntil(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => FirstScreen()
//                      ),
//                      ModalRoute.withName("/")
//                  );
                  //Navigator.popAndPushNamed(context, '/');
                  //Navigator.pushNamed(context, "/");
                  //Navigator.pop(context);
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
                    textCapitalization: TextCapitalization.sentences,
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
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Any short notes?",
                        counterText: "",
                        counterStyle: TextStyle(fontSize: 0),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: FractionalOffset(0.5, 1),
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: 60.0,
                      margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 4.0, bottom: 0.0),
                      //padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: Container(
                          decoration: new BoxDecoration(
                            color: DewitColors.darkPurple,
                            borderRadius: new BorderRadius.vertical(
                              top: new Radius.circular(4.0),
                            ),
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
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Add a time",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Set as priority",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.outlined_flag,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Schedule this",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.event,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Send a notification in advance",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.notifications_none,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Create a tag",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.label_outline,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Spacer(),
                                      Tooltip(
                                        verticalOffset: -66.0,
                                        message: "Add a color",
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.color_lens,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
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
  final String index;
  final Tasks _selectedTask;

  ThirdScreen(this.index, this._selectedTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        //title: Text("Second Route"),
//        backgroundColor: DewitColors.lightPurple,
//      ),
      body: Container(
        color: DewitColors.background,
        child: Align(
        alignment: FractionalOffset(0.5, 0.3),
        child: Hero(
          tag: index,
          flightShuttleBuilder: flightShuttleBuilder,
              child: Text(
                "${_selectedTask.title}\n${_selectedTask.note}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      ),
    );
  }
}


class Tasks {
  final String title;
  final String note;

  Tasks(this.title, this.note);
}


class GoalsScreen extends StatefulWidget {
  GoalsScreen({Key key}) : super(key: key);

  @override
  _GoalsScreen createState() {
    return _GoalsScreen();
  }
}


class _GoalsScreen extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        //app bar will go here
      ),
      body: Expanded(
        //body goes here-- does not have to be "Expanded," but might be the best way later on
      ),
    );
  }
}
