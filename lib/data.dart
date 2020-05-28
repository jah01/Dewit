import 'package:dewitapp/widgets.dart';

import 'colors.dart';
import 'package:flutter/material.dart';


class Select {
  const Select({this.title, this.icon});

  final String title;
  final IconData icon;
}


const List<Select> selection = const <Select>[
  const Select(title: "Extra1", icon: Icons.search),
  const Select(title: "Extra2", icon: Icons.search),
];


List<Task> items = new List();


class Task {
  final String title;
  final String note;
  final DateTime dateAndTime;
  final Color color;
  final String tag;
  final bool priority;

  String get getTitle {
    return title;
  }

  String get getNote {
    return note;
  }

  DateTime get getDateAndTime {
    return dateAndTime;
  }

  Color get getColor {
    return color;
  }

  String get getTag {
    return tag;
  }

  bool get getPriority {
    return priority;
  }

  Task(this.title, this.note, this.dateAndTime, [this.color, this.tag, this.priority]);
}


enum UserColors {
  red,
  orange,
  yellow,
  green,
  blue,
  purple
}


void resetAll() {
  selectedDate = null;
  selectedTime = null;
  hasDate = false;
  finalDate = null;
  finalTime = null;
  hasTime = false;
  dateAndTime = null;
  selectedColor = null;
  createdTags = null;
}


var selectedDate;
var finalDate;
var selectedTime;
var finalTime;
bool hasDate = false;
bool hasTime = false;
var dateAndTime;
var selectedColor;
var createdTags;

Future<DateTime> selectDate(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(2150),
  );
}


Future<TimeOfDay> selectTime(BuildContext context) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: 0, minute: 0),
  );
}


Future<DateTime> getTime(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(2150),
  );
}


const op1 = "Orange";
const op2 = "Yellow";
const op3 = "Green";
const op4 = "Blue";
const op5 = "Purple";

Future<String> selectColor(context) async {
  switch (await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Select a color"),
          children: <Widget>[
            SecondScreenColorOption(context, op1, "Orange"),
            SecondScreenColorOption(context, op2, "Yellow"),
            SecondScreenColorOption(context, op3, "Green"),
            SecondScreenColorOption(context, op4, "Blue"),
            SecondScreenColorOption(context, op5, "Purple"),
          ],
        );
      }
  )) {
    case op1:
      return op1;
      break;
    case op2:
      return op2;
      break;
    case op3:
      return op3;
      break;
    case op4:
      return op4;
      break;
    case op5:
      return op5;
      break;
  }
}


//huge help from https://androidkt.com/flutter-alertdialog-example/
Future<String> createTags(BuildContext context, [String prevText]) async {
  String current;
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Enter your tags"),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextFormField(
                  initialValue: prevText,
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: "Tags", hintText: 'eg. \"shopping list\"'),
                  onChanged: (value) {
                    current = value;
                  },
                ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(current);
            },
          ),
        ],
      );
    },
  );
}
