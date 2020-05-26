import 'package:dewitapp/main.dart';
import 'package:dewitapp/colors.dart';
import 'package:dewitapp/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';


//TODO NAVBAR
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: DewitColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: DewitColors.darkGray, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: DewitColors.coalBlack,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    image: AssetImage('assets/images/cover.jpg'))
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => {},
              child: ListTile(
                leading: Icon(Icons.home,
                  color: DewitColors.darkGray,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: DewitColors.darkGray),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => {Navigator.of(context).pop()},
              child: ListTile(
                leading: Icon(Icons.drafts,
                  color: DewitColors.darkGray,
                ),
                title: Text(
                    "Other",
                  style: TextStyle(color: DewitColors.darkGray),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => {Navigator.of(context).pop()},
              child: ListTile(
                leading: Icon(Icons.restore,
                  color: DewitColors.darkGray,
                ),
                title: Text(
                  "Other",
                  style: TextStyle(color: DewitColors.darkGray),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => {Navigator.of(context).pop()},
              child: ListTile(
                leading: Icon(Icons.timeline,
                  color: DewitColors.darkGray,
                ),
                title: Text(
                  "Other",
                  style: TextStyle(color: DewitColors.darkGray),
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => {Navigator.of(context).pop()},
              child: ListTile(
                leading: Icon(Icons.settings,
                  color: DewitColors.darkGray,
                ),
                title: Text(
                  "Other",
                  style: TextStyle(color: DewitColors.darkGray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//TODO FirstScreen starts here
class FirstScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DewitColors.coalBlack,
      iconTheme: new IconThemeData(color: DewitColors.lightGray),
      title: const Text(
        "Dewit",
        style: TextStyle(color: DewitColors.lightGray),
      ),
      actions: <Widget>[
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              //one or the other
              //Scaffold.of(context).showSnackBar(SnackBar(content: Text("SnackBar search!"),));
              //TODO THIS IS IMPORTANT FOR LATER
              //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class FirstScreenTopPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0, bottom: 0.0),
//                            child: Text(
//                              "Today",
//                              style: TextStyle(
//                                fontSize: 28,
//                                fontWeight: FontWeight.bold,
//                                color: DewitColors.darkPurple,
//                              ),
//                            ),
      ),
    );
  }
}


class FirstScreenHero extends StatelessWidget {
  final w;
  FirstScreenHero(this.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.0, right: 4.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: w,
    );
  }
}

class FirstScreenListButton extends StatelessWidget {
  final int index;
  final Task item;
  final String title;
  final String note;
  FirstScreenListButton(this.index, this.item, this.title, this.note);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
      child: FirstScreenListTile(title, note),
    );
  }
}


class FirstScreenListTile extends StatelessWidget {
  final String title;
  final String note;
  FirstScreenListTile(this.title, this.note);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Container(
      //padding: EdgeInsets.all(0.0),
      //child: Icon(
      //Icons.check_box_outline_blank,
      //color: DewitColors.darkGray,
      //size: 24.0,
      //),
      //),
      contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
      dense: false,
      title: FirstScreenTitle(title),
      //TODO make an if statement, make the cards less dense if desired
      subtitle: FirstScreenSubtitle(note),
      isThreeLine: true,
      //trailing: Icon(Icons.access_alarm),
    );
  }
}


class FirstScreenTitle extends StatelessWidget {
  final String title;
  FirstScreenTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: AutoSizeText(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        minFontSize: 20,
        style: TextStyle(
          color: DewitColors.lightGray,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}


class FirstScreenSubtitle extends StatelessWidget {
  final String note;
  FirstScreenSubtitle(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.only(top: 0.0, bottom: 10.0),
      child: AutoSizeText(
        note,
        style: TextStyle(
          color: DewitColors.darkGray,
          fontSize: 12,
        ),
      ),
    );
  }
}


Widget firstScreenDivider() {
  return Divider(
    color: DewitColors.coalBlack,
    height: 10,
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );
}


class DismissibleBackground1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DewitColors.lightPurple,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.centerStart,
      child: Icon(
        Icons.delete,
        color: DewitColors.lightGray,
      ),
    );
  }
}


class DismissibleBackground2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DewitColors.lightPurple,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.centerEnd,
      child: Icon(
        Icons.delete,
        color: DewitColors.lightGray,
      ),
    );
  }
}


class FirstScreenBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset(0.5, 1),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 60.0,
          margin: const EdgeInsets.all(6.0),
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
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 31,
                              child: Hero(
                                tag: "addSomething",
                                child: Container(
                                  height: double.infinity,
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
                                                color: DewitColors.iconColor,
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
                                      //THIS IS TEMPORARY
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => GoalsScreen()));
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
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}


//TODO SecondScreen starts here
class SecondScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final titleController;
  final noteController;
  SecondScreenAppBar(this.titleController, this.noteController);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Tooltip(
        message: "Discard task",
        child: IconButton(
          icon:Icon(Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {
//            selectedDate = null;
//            selectedTime = null;
            Navigator.pop(context);
          },
        ),
      ),
      title: Text("Add a task!",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF1c1d28),
      actions: <Widget>[
        Tooltip(
          message: "Add task",
          child: IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () async {
              String newTitle = titleController.text;
              int len1 = titleController.text.length;
              if (len1 == 0) {
                newTitle = null;
              } else {
                while (newTitle[len1 - 1] == ' ') {
                  len1--;
                  newTitle = newTitle.substring(0, len1);
                }
                int startTitle = 0;
                for (int i = 0; i < titleController.text.length; i++) {
                  if (titleController.text[i] == ' ') {
                    startTitle++;
                  } else {
                    break;
                  }
                }
                newTitle = newTitle.substring(startTitle);
                if (newTitle.length == 0) {
                  newTitle = null;
                }
              }
              if (newTitle == null) {
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("You must add something first")));
                Toast.show("You must add something first", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              } else {
                FocusScope.of(context).unfocus();
                //TODO COME BACK HERE
                //working with "optional" notes
                String condensed = noteController.text;
                String newNote;
                int leading = 0;
                for (int i = 0; i < noteController.text.length; i++) {
                  if (condensed[i] == ' ' || condensed[i] == '\n') {
                    leading++;
                  } else {
                    break;
                  }
                }
                condensed = condensed.substring(leading);
                int trailing = 0;
                if (!(condensed.length == 0)) {
                  for (int i = condensed.length; i > 0; i--) {
                    if (condensed[i - 1] == ' ' || condensed[i - 1] == '\n') {
                      trailing++;
                    } else {
                      break;
                    }
                  }
                }
                condensed = condensed.substring(0, condensed.length - trailing);
                if (condensed.length > 0) {
                  newNote = condensed;
                }
//                final selectedDate = await getDate(context);
//                if (selectedDate == null) return;
                if (selectedDate == null) {
                  Toast.show("You must add a date first", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                  return;
                } else {
                  items.add(Task(newTitle, newNote, selectedDate));
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/", (Route<dynamic> route) => false);
                  });
                  //for later
//                  print(
//                    selectedDate.year.toString() + "\n" +
//                        selectedDate.month.toString() + "\n" +
//                        selectedDate.day.toString() + "\n" +
//                        selectedTime.hour.toString() + "\n" +
//                        selectedTime.minute.toString()
//                  );
                  selectedDate = null;
                  selectedTime = null;
                }
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class BigPurple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF393a50),
      width: double.infinity,
      height: double.infinity,
    );
  }
}


class SecondScreenParent extends StatelessWidget {
  final child;
  SecondScreenParent(this.child);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: child,
        ));
  }
}

class SecondScreenTitle extends StatelessWidget {
  final titleController;
  SecondScreenTitle(this.titleController);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          color: Colors.white70,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your task...",
          hintStyle: TextStyle(color: Colors.white54),
          counterText: "",
          counterStyle: TextStyle(fontSize: 0),
        ),
      ),
    );
  }
}


class SecondScreenNotes extends StatelessWidget {
  final noteController;

  SecondScreenNotes(this.noteController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: noteController,
        maxLength: 120,
        maxLengthEnforced: true,
        keyboardType: TextInputType.multiline,
        minLines: 4,
        maxLines: 4,
        autofocus: true,
        showCursor: true,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Any short notes?",
          hintStyle: TextStyle(color: Colors.white54),
          counterText: "",
          counterStyle: TextStyle(fontSize: 0,),
        ),
      ),
    );
  }
}


class SecondScreenSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }
}


class SecondScreenCategory extends StatelessWidget {
  final String text;
  SecondScreenCategory(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 28.0, bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white70,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


class SecondScreenIconButton extends StatefulWidget {

  final String text;
  final IconData ic;
  final double leftMargin;
  final Key key;
  SecondScreenIconButton(this.text, this.ic, this.leftMargin, this.key);

  @override
  _SecondScreenIconButton createState() => new _SecondScreenIconButton(this.text, this.ic, this.leftMargin, this.key);
}


class _SecondScreenIconButton extends State<SecondScreenIconButton> {
  final String text;
  final IconData ic;
  final double leftMargin;
  final Key key;
  _SecondScreenIconButton(this.text, this.ic, this.leftMargin, this.key);
  bool hasDate = false;
  String del = "";

  var selectedDate = null;
  var selectedTime = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70, width: 2),
        color: (hasDate) ? Colors.white24 : Colors.transparent,
        //color: Colors.transparent,
        borderRadius: new BorderRadius.all(Radius.circular(50.0)),
      ),
      child: FlatButton.icon(
        splashColor: Colors.white24,
        highlightColor: Colors.white24,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.0),
        ),
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (key == Key("date")) {
            del = "Delete date";
              if (selectedDate == null) {
                selectedDate = await selectDate(context);
              } else {
                selectedDate = null;
              }
              setState(() {
                hasDate = (selectedDate != null);
              });
          } else if (key == Key("time")) {
            del = "Delete time";
            selectedTime = await selectTime(context);
          } else if (key == Key("color")) {
            del = "Edit color";

          } else if (key == Key("tag")) {
            del = "Edit tags";

          } else if (key == Key("priority")) {
            del = "Delete priority";

          } else {
            print("ERROR");
          }
        },
        icon: Padding(
          padding: EdgeInsets.only(left: leftMargin, right: 0.0),
          child: Icon(
              hasDate ? Icons.clear : ic,
              color: Colors.white70,
              size: 20
          ),
        ),
        label: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 0.0),
          child: Text(

            hasDate ? del : text,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
          ),
        ),
      ),
    );
  }
}


class SecondScreenBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            ),
          ),
        ),
      ),
    );
  }
}


//TODO ThirdScreen starts here


class ThirdScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //will be changed later
      width: 0.0,
      height: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class ThirdScreenBody extends StatelessWidget {
  final String index;
  final Task _selectedTask;
  ThirdScreenBody(this.index, this._selectedTask);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


//huge help from zyllus17 on https://github.com/flutter/flutter/issues/12463
Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
    ) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}
