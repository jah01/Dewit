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
      home: SignUp(),
      initialRoute: "/",
      routes: {
        //"/": (context) => SignUp(),
        //"/second": (context) => SecondScreen(),
      },
    ));
  });
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
    //clears everything beforehand (great for after a user logs out
//    SchedulerBinding.instance.addPostFrameCallback((_) {
//      Navigator.of(context).pushNamedAndRemoveUntil(
//          "/", (Route<dynamic> route) => false);
//    });
//    FocusNode firstName = FocusNode();
//    FocusNode lastName = FocusNode();
//    FocusNode email = FocusNode();
//    FocusNode password = FocusNode();
//    FocusNode confirmPassword = FocusNode();
//    TextEditingController firstNameController = TextEditingController();
//    TextEditingController lastNameController = TextEditingController();
//    TextEditingController emailController = TextEditingController();
//    TextEditingController passwordController = TextEditingController();
//    TextEditingController confirmPasswordController = TextEditingController();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
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
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
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
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 60)),
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
                    onPressed: () {
                    },
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
//                    color: Color(0xFF9099a3),
//                    child: Text("hello"),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [DewitColors.oldDarkPurple, DewitColors.oldLightPurple],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(32.0)
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 208.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Sign Up",
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
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
//                    color: Color(0xFF9099a3),
//                    child: Text("hello"),
                    child: OutlineGradientButton(
                      onTap: () {
                        //print("hello");
                      },
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
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
                Padding(padding: EdgeInsets.only(top: 32.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
