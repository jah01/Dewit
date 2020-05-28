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


void resetAll() {
  selectedDate = null;
  selectedTime = null;
  hasDate = false;
  finalDate = null;
  finalTime = null;
  hasTime = false;
  dateAndTime = null;
}


var selectedDate;
var finalDate;
var selectedTime;
var finalTime;
bool hasDate = false;
bool hasTime = false;
var dateAndTime;

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
