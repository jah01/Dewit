import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:dewitapp/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: DewitColors.background,
        accentColor: DewitColors.darkPurple,
        backgroundColor: DewitColors.lightPurple,
      ),
      home: FirstScreen(),
      initialRoute: "/",
      routes: {
        //'/': (context) => FirstScreen(),
        "/second": (context) => SecondScreen(),
      },
    ));
  });
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

  @override
  Widget build(BuildContext context) {
    //total.clear();
    //getAllTasks();
    //mergeTasks();
    getList();
    return Scaffold(
      backgroundColor: DewitColors.background,
      drawer: NavDrawer(),
      appBar: FirstScreenAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                child: Container(
                  //TODO all other things on this page belong here and only here-- do not mess up the search bar
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
//                      var list = map.values.toList();
                      final current = list[index];
                      return ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: current.getTasks.length,
                        itemBuilder: (BuildContext context, int i) {
                          final size = (i == 0) ? 28.0 : 0.0;
                          final spacing = (i == 0 && index > 0) ? 12.0 : 0.0;
                          final pad1 = (i == 0) ? 8.0 : 0.0;
                          final pad2 = (i == current.getTasks.length - 1) ? 0.0 : 10.0;
                          final element = current.getTasks[i];
                          bool isOverdue = element.getDateAndTime.isBefore(DateTime.now());
                          final header = isOverdue ? "Overdue" : formatDate(element.getDate);
//                          final title = element.getTitle;
//                          final note = element.getNote;
                          return Column(
                            children: <Widget>[
                              FirstScreenTopPadding(),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: pad1, left: pad1, right: pad1, bottom: 0.0),
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: spacing, bottom: 0.0),
                                      child: Row(children: <Widget>[
                                        Text(
                                          header,
                                          style: TextStyle(
                                            fontSize: size,
                                            fontWeight: FontWeight.bold,
                                            color: DewitColors.oldDarkPurple,
                                          ),
                                        ),
                                        (i == 0)
                                            ? Expanded(
                                                child: Divider(
                                                color:
                                                    DewitColors.oldDarkPurple,
                                                height: 10,
                                                thickness: 3,
                                                indent: 6,
                                                endIndent: 8,
                                              ))
                                            : Container(
                                                width: 0,
                                                height: 0,
                                              ),
                                      ])),
                                ),
                              ),
                              Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  setState(() {
                                    //dismissed = current.getTasks[i];
                                    current.getTasks.removeAt(i);
                                    if (current.getTasks.length == 0) {
                                      makeNewOne = true;
                                      makeNewOneIndex = index;
                                      list.removeAt(index);
                                    }
                                  });
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("\"" +
                                          element.getTitle +
                                          "\" dismissed."),
                                      action: SnackBarAction(
                                        label: "UNDO",
                                        onPressed: () =>
                                            setState(() => addToList(element)),
                                      ),
                                    ),
                                  );
                                },
                                background: DismissibleBackground1(),
                                secondaryBackground: DismissibleBackground2(),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  child: Hero(
                                    tag: UniqueKey().toString(),
                                    child: FirstScreenHero(
                                      FirstScreenListButton(i, element),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return firstScreenDivider();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            FirstScreenBottomBar(),
          ],
        ),
      ),
    );
  }
}

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
    resetAll();
    return Scaffold(
      backgroundColor: DewitColors.lightPurple,
      appBar: SecondScreenAppBar(this.titleController, this.noteController),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(tag: "addSomething", child: BigPurple()),
            NoOverscrollWidget(
                Column(
                  children: <Widget>[
                    Container(child: SecondScreenTitle(titleController)),
                    SecondScreenNotes(noteController),
                    SecondScreenSpacer(),
                    Container(
                      height: 236,
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[SecondScreenCategory("Required")]),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                SecondScreenIconButton("Add a date", Icons.today, 8.0, Key("date")),
                              ],
                            ),
                          ),
                          Container(margin: EdgeInsets.only(top: 10.0)),
                          Row(children: <Widget>[SecondScreenCategory("Optional")]),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                SecondScreenIconButton("Add a time", Icons.access_time, 8.0, Key("time")),
                                SecondScreenIconButton("Add a color", Icons.color_lens, 8.0, Key("color")),
                                SecondScreenIconButton("Add a tag", Icons.label_outline, 8.0, Key("tag")),
                                SecondScreenIconButton("Make Priority", Icons.outlined_flag, 8.0, Key("priority")),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String index;
  final Task _selectedTask;

  ThirdScreen(this.index, this._selectedTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThirdScreenAppBar(),
      body: SafeArea(
        child: ThirdScreenBody(index, _selectedTask),
      ),
    );
  }
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
