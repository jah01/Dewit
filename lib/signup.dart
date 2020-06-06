import 'package:dewitapp/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
//    theme: ThemeData(
//      brightness: Brightness.dark,
//      primaryColor: DewitColors.background,
//      accentColor: DewitColors.darkPurple,
//      backgroundColor: DewitColors.lightPurple,
//    ),
    home: SignUp(),
    initialRoute: "/",
    routes: {
      //'/': (context) => FirstScreen(),
      //"/second": (context) => SecondScreen(),
    },
  ));
}


class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUp createState() {
    return _SignUp();
  }
}


class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height - 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}