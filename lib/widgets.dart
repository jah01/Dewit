import 'package:dewitapp/colors.dart';
import 'package:dewitapp/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


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


Widget FirstScreenDivider() {
  return Divider(
    color: DewitColors.coalBlack,
    height: 10,
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );
}


//TODO SecondScreen starts here


//TODO ThirdScreen starts here
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
