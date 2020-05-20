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


class Tasks {
  final String title;
  final String note;

  Tasks(this.title, this.note);
}
