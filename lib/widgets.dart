import 'package:dewitapp/main.dart';
import 'package:dewitapp/colors.dart';
import 'package:dewitapp/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/scheduler.dart';
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
  final Tasks item;
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
      color: DewitColors.darkPurple,
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
      color: DewitColors.darkPurple,
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
            Navigator.pop(context);
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
            onPressed: () async {
              if (titleController.text.length == 0) {
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("You must add something first")));
                Toast.show("You must add something first", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              } else {
                FocusScope.of(context).unfocus();
                //TODO COME BACK HERE
                final selectedDate = await getDate(context);
                if (selectedDate == null) return;
                items.add(Tasks(titleController.text, noteController.text));
                print(selectedDate);
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/", (Route<dynamic> route) => false);
                  });
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
      color: DewitColors.lightPurple,
      width: double.infinity,
      height: double.infinity,
    );
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
          //color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your task...",
          //hintStyle: TextStyle(color: Colors.white),
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
        minLines: 2,
        maxLines: 4,
        autofocus: true,
        showCursor: true,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          fontSize: 16,
          //color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Any short notes?",
          //hintStyle: TextStyle(color: Colors.white),
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
          color: DewitColors.darkPurple,
        ),
      ),
    );
  }
}


class SecondScreenIconButton extends StatelessWidget {
  final String text;
  SecondScreenIconButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: DewitColors.darkPurple, width: 2),
        color: Colors.transparent,
        borderRadius: new BorderRadius.all(Radius.circular(50.0)),
      ),
      child: FlatButton.icon(
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.0),
        ),
        onPressed: () {
          print("test");
        },
        icon: Padding(
          padding: EdgeInsets.only(left: 4.0, right: 0.0),
          child: Icon(Icons.add, color: DewitColors.darkPurple, size: 20,),
        ),
        label: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 0.0),
          child: Text(text,
              style: TextStyle(
                color: DewitColors.darkPurple,
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
  String index;
  Tasks _selectedTask;
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
