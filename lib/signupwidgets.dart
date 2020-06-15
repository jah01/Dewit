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


class StandardTF extends StatelessWidget {
  final c;
  final hintText;
  final darkBackground;
  StandardTF(this.hintText, this.c, this.darkBackground);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //focusNode: firstName,
      //controller: firstNameController,
      controller: c,
      keyboardType: TextInputType.text,
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(
//        color: Color(0xFF9099a3),
      color: (darkBackground) ? DewitColors.oldLightPurple : DewitColors.lightPurple,
        fontSize: 16,
      ),
      decoration: new InputDecoration(
        //contentPadding: EdgeInsets.all(0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            //color: Color(0xFF465666),
            //color: Color(0xFF6a7784),
            //color: Color(0xFF6a7784),
            color: (darkBackground) ? DewitColors.oldLightPurple : DewitColors.lightPurple,
            //color: Color(0xFF4c4d61),
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            //color: Color(0xFF465666),
            //color: Color(0xFF888896),
            color: (darkBackground) ? DewitColors.oldLightPurple : DewitColors.lightPurple,
            width: 2,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            //color: Color(0xFF6a7784),
            //color: Color(0xFF6a7784),
            color: (darkBackground) ? DewitColors.oldLightPurple : DewitColors.lightPurple,
            //color: Color(0xFF4c4d61),
            width: 2,
          ),
        ),
        hintText: hintText,
        //prefixIcon: Icon(Icons.alternate_email, color: DewitColors.oldLightPurple,),
        hintStyle: TextStyle(
          //color: Color(0xFF6a7784),
          color: (darkBackground) ? Color(0xFF505050) : Color(0xFF6a7784),
          //color: DewitColors.lightPurple,
        ),
        counterStyle: TextStyle(fontSize: 0),
      ),
      //cursorColor: Color(0xFF9099a3),
      cursorColor: (darkBackground) ? DewitColors.oldLightPurple : DewitColors.lightPurple,
      cursorWidth: 2,
      maxLength: 24,
    );
  }
}
