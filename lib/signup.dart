import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
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
        body: Stack(
          children: <Widget>[
            //TODO all other widgets will go here (so as not to draw over the text
            SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: NoOverscrollWidget(
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(top: saHeight * .1),
//                      ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            //color: Colors.green,
                            width: MediaQuery.of(context).size.width - 32,
                            //height: saHeight * .8,
                            padding: EdgeInsets.only(top: saHeight * .04, bottom: saHeight * .04),
                            child: Column(
                              children: <Widget>[
                                //Padding(padding: EdgeInsets.only(top: 16.0, bottom: 32.0),),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Welcome to Dewit",
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .04,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "The app for reaching goals\nand keeping habits",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                //Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .02,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Name",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .01,
                                  ),
                                ),
                                Theme(
                                  data: new ThemeData(
                                    primaryColor: DewitColors.oldLightPurple,
                                    cursorColor: DewitColors.oldLightPurple,
                                  ),
                                  child: TextField(
                                    controller: nameController,
                                    autofocus: false,
                                    style: TextStyle(
                                        color: DewitColors.oldLightPurple),
                                    decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color:
                                                  DewitColors.oldLightPurple)),
                                      hintText: "ex: Toucan Sam",
                                      //prefixIcon: Icon(Icons.alternate_email, color: DewitColors.oldLightPurple,),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700]),
                                    ),
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.grey, width: 12.0),
//                        ),
//                        //labelText: "email@example.com",
//                        labelStyle: TextStyle(color: DewitColors.oldDarkPurple),
//                        focusColor: DewitColors.oldDarkPurple,
//                      ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .02,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Email",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .01,
                                  ),
                                ),
                                Theme(
                                  data: new ThemeData(
                                    primaryColor: DewitColors.oldLightPurple,
                                    cursorColor: DewitColors.oldLightPurple,
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    autofocus: false,
                                    style: TextStyle(
                                        color: DewitColors.oldLightPurple),
                                    decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color:
                                                  DewitColors.oldLightPurple)),
                                      hintText: "ex: toucan@sam.com",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .02,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Password",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .01,
                                  ),
                                ),
                                Theme(
                                  data: new ThemeData(
                                    primaryColor: DewitColors.oldLightPurple,
                                    cursorColor: DewitColors.oldLightPurple,
                                  ),
                                  child: TextField(
                                    controller: passwordController,
                                    autofocus: false,
                                    style: TextStyle(
                                        color: DewitColors.oldLightPurple),
                                    decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color:
                                                  DewitColors.oldLightPurple)),
                                      hintText: "create a password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .02,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Confirm Password",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: DewitColors.oldDarkPurple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .01,
                                  ),
                                ),
                                Theme(
                                  data: new ThemeData(
                                    primaryColor: DewitColors.oldLightPurple,
                                    cursorColor: DewitColors.oldLightPurple,
                                  ),
                                  child: TextField(
                                    controller: confirmPasswordController,
                                    autofocus: false,
                                    style: TextStyle(
                                        color: DewitColors.oldLightPurple),
                                    decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: DewitColors.oldLightPurple,
                                            width: 3.0),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color:
                                                  DewitColors.oldLightPurple)),
                                      hintText: "verify your password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: saHeight * .04,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Already have an account? ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: DewitColors.oldDarkPurple,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Sign in here",
                                        style: TextStyle(
                                          color: DewitColors.oldDarkPurple,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "!",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: DewitColors.oldDarkPurple,
                                        ),
                                      ),
                                    ],
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
            ),
          ],
        ),
      ),
    );
  }
}
