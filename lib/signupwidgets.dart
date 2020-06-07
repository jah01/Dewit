import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';


class SignUpInfo extends StatelessWidget {
  final saHeight;
  final title;
  final exampleText;
  final controller;
  SignUpInfo(this.saHeight, this.title, this.exampleText, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: saHeight * .02,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: DewitColors.oldDarkPurple,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: saHeight * .0025,
          ),
        ),
        Theme(
          data: new ThemeData(
            primaryColor: DewitColors.oldLightPurple,
            cursorColor: DewitColors.oldLightPurple,
          ),
          child: TextField(
            controller: controller,
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
              hintText: exampleText,
              //prefixIcon: Icon(Icons.alternate_email, color: DewitColors.oldLightPurple,),
              hintStyle:
              TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
