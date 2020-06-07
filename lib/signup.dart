import 'package:dewitapp/colors.dart';
import 'package:dewitapp/widgets.dart';
import 'package:dewitapp/signupwidgets.dart';
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
    var h = MediaQuery.of(context).size.height;
    var saHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    bool isTall = h >= 680;
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
                                SignUpInfo(saHeight, "Name", "ex: Toucan Sam", nameController),
                                SignUpInfo(saHeight, "Email", "ex: toucan@sam.com", emailController),
                                SignUpInfo(saHeight, "Password", "create a password", passwordController),
                                SignUpInfo(saHeight, "Confirm Password", "verify your password", confirmPasswordController),
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
