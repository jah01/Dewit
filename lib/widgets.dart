import 'package:dewitapp/colors.dart';
import 'package:flutter/material.dart';


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
