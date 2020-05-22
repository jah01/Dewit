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


List<Tasks> items = new List();


class Tasks {
  final String title;
  final String note;

  Tasks(this.title, this.note);
}

Future<DateTime> getDate(BuildContext context) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2150),
  );
}


Future<DateTime> getTime(BuildContext context) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now().add(Duration(seconds: 1)),
    firstDate: DateTime.now(),
    lastDate: DateTime(2150),
  );
}
