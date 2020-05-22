import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:dewitapp/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DewitColors.background,
      drawer: NavDrawer(),
      appBar: FirstScreenAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
              child: Container(
                //TODO all other things on this page belong here and only here-- do not mess up the search bar
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    final String title = "${item.title}";
                    final String note = "${item.note}";
                    return Column(
                      children: <Widget>[
                        FirstScreenTopPadding(),
                        Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {items.removeAt(index);});
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("\"" + title + "\" dismissed."),
                                action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () => setState(() => items.insert(index, item)),
                                )));
                          },
                          background: DismissibleBackground1(),
                          secondaryBackground: DismissibleBackground2(),
                          child: Hero(
                            tag: index.toString(),
                            child: FirstScreenHero(
                                FirstScreenListButton(index, item, title, note),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {return firstScreenDivider();},
                ),
              ),
            ),
          ),
          FirstScreenBottomBar(),
        ],
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
    return Scaffold(
      appBar: SecondScreenAppBar(this.titleController, this.noteController),
      body: Stack(
        children: <Widget>[
          Hero(tag: "addSomething", child: BigPurple()),
          Column(
            children: <Widget>[
              Container(child: SecondScreenTitle(titleController)),
              Expanded(child: SecondScreenNotes(noteController)),
              //SecondScreenBottomBar(),
            ],
          ),
        ],
      ),
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
      appBar: ThirdScreenAppBar(),
      body: ThirdScreenBody(index, _selectedTask),
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
