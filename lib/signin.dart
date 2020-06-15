import 'package:auto_size_text/auto_size_text.dart';
import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:dewitapp/signupwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
//    theme: ThemeData(
//      brightness: Brightness.dark,
//      primaryColor: DewitColors.background,
//      accentColor: DewitColors.darkPurple,
//      backgroundColor: DewitColors.lightPurple,
//    ),
      home: LandingPage(),
      initialRoute: "/",
      routes: {
        "/signup": (context) => SignUp(),
        "/signup2": (context) => SignUp2(),
        "/signin": (context) => SignIn(),
        //"/second": (context) => SecondScreen(),
      },
    ));
  });
}


class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPage createState() {
    return _LandingPage();
  }
}


class _LandingPage extends State<LandingPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO clear everything beforehand (great for after a user logs out)

    var saHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: DewitColors.darkPurple,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF465666), DewitColors.lightPurple],
                  //colors: [Color(0xFF25507d), DewitColors.lightPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, .9],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (saHeight * .2) + MediaQuery.of(context).padding.top),
              height: saHeight * .6,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.only(top: 60)),
                    AutoSizeText(
                      "Welcome to Dewit",
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.oldLightPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    AutoSizeText(
                      "The app for reaching goals\nand keeping habits",
                      style: TextStyle(
                        color: DewitColors.oldLightPurple,
                        //color: Color(0xFF9099a3),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Spacer(),
                    Text(
                      "New around here?",
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.oldLightPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Container(
                      height: 60,
                      //width: 208,
                      //width: w,
                      //padding: EdgeInsets.only(left: w - 100, right: 80.0),
                      child: FlatButton(
//                        onPressed: () {
//                          Navigator.pushNamed(context, "/signup");
//                        },
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
//                    color: Color(0xFF9099a3),
//                    child: Text("hello"),
                        child: Hero(
                          tag: "signup",
                          child: Material(
                            color: Colors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      DewitColors.oldDarkPurple,
                                      DewitColors.oldLightPurple
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(32.0),
                                splashColor: DewitColors.oldDarkPurple,
                                highlightColor: Color(0xAAC7C9ED),
                                onTap: () {
                                  Navigator.pushNamed(context, "/signup");
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 208.0, minHeight: 50.0),
                                  alignment: Alignment.center,
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Text(
//                                  "Sign Up",
//                                  textAlign: TextAlign.center,
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 20,
//                                    fontWeight: FontWeight.w500,
//                                  ),
//                                ),
//                              ],
//                            )
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Sign Up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      ListTile(
                                        trailing: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 24.0)),
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.oldLightPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Container(
                      height: 64,
                      child: Hero(
                        tag: "signin",
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signin");
                          },
                          padding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
//                    color: Color(0xFF9099a3),
//                    child: Text("hello"),
                          child: OutlineGradientButton(
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 200.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            gradient: LinearGradient(colors: [
                              DewitColors.oldDarkPurple,
                              DewitColors.oldLightPurple
                            ]),
                            strokeWidth: 4,
                            radius: Radius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(top: 32.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUp createState() {
    return _SignUp();
  }
}


class _SignUp extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var saHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: DewitColors.darkPurple,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Hero(
              tag: "signup",
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      DewitColors.oldDarkPurple,
                      DewitColors.oldLightPurple,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                //color: DewitColors.darkPurple,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (saHeight * .1) + MediaQuery.of(context).padding.top),
              //height: saHeight * .6,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.only(top: 60)),
                    AutoSizeText(
                      "We're so glad you're here!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.lightPurple,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    AutoSizeText(
                      "Let's create an account",
                      style: TextStyle(
                        color: DewitColors.lightPurple,
                        //color: Color(0xFF9099a3),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    //Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                      //color: Colors.greenAccent,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child:
                                StandardTF("First Name", firstNameController),
                          ),
                          Spacer(flex: 2),
                          Expanded(
                            flex: 10,
                            child: StandardTF("Last Name", lastNameController),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                      child: StandardTF("Email", emailController),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 24.0)),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Hero(
                        tag: "continue",
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    DewitColors.darkPurple,
                                    DewitColors.lightPurple
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(32.0)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              splashColor: DewitColors.oldDarkPurple,
                              highlightColor: Color(0xAAC7C9ED),
                              onTap: () {
                                Navigator.pushNamed(context, "/signup2");
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 208.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}


class SignUp2 extends StatefulWidget {
  SignUp2({Key key}) : super(key: key);

  @override
  _SignUp2 createState() {
    return _SignUp2();
  }
}


class _SignUp2 extends State<SignUp2> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var saHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: DewitColors.darkPurple,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Hero(
              tag: "continue",
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      DewitColors.darkPurple,
                      DewitColors.lightPurple,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                //color: DewitColors.darkPurple,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (saHeight * .1) + MediaQuery.of(context).padding.top),
              //height: saHeight * .6,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.only(top: 60)),
                    AutoSizeText(
                      "We're so glad you're here!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.lightPurple,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    AutoSizeText(
                      "Let's create an account",
                      style: TextStyle(
                        color: DewitColors.lightPurple,
                        //color: Color(0xFF9099a3),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    //Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                            child:
                            StandardTF("Create password", passwordController),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                      child: StandardTF("Confirm password", confirmPasswordController),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 24.0)),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Hero(
                        tag: "continue2",
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    DewitColors.darkPurple,
                                    DewitColors.lightPurple
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(32.0)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              splashColor: DewitColors.oldDarkPurple,
                              highlightColor: Color(0xAAC7C9ED),
                              onTap: () {
                                //Navigator.pushNamed(context, "/signup2");
                                print("this works");
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 208.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}


class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignIn createState() {
    return _SignIn();
  }
}


class _SignIn extends State<SignIn> {
  final usernameController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var saHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: DewitColors.darkPurple,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Hero(
              tag: "signin",
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
//                      Color(0xFF465666),
//                      DewitColors.lightPurple,
                    DewitColors.oldDarkPurple,
                    DewitColors.lightPurple
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: (saHeight * .1) + MediaQuery.of(context).padding.top),
              //height: saHeight * .6,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.only(top: 60)),
                    AutoSizeText(
                      "We're so glad you're here!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Color(0xFF9099a3),
                        color: DewitColors.lightPurple,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    AutoSizeText(
                      "Let's create an account",
                      style: TextStyle(
                        color: DewitColors.lightPurple,
                        //color: Color(0xFF9099a3),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    //Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                      child: StandardTF("Email", usernameController),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Container(
                      width: MediaQuery.of(context).size.width - 64,
                      height: 60,
                      child: StandardTF("Password", pwController),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 24.0)),
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Hero(
                        tag: "continue",
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    DewitColors.darkPurple,
                                    DewitColors.lightPurple
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(32.0)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32.0),
                              splashColor: DewitColors.oldDarkPurple,
                              highlightColor: Color(0xAAC7C9ED),
                              onTap: () {
                                //Navigator.pushNamed(context, "/signup2");
                              },
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 208.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
