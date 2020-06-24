import 'package:dewitapp/widgets.dart';
import 'package:intl/intl.dart';

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
Map<DateTime, List<Task>> map = new Map();
Map<DateTime, List<Task>> newMap = new Map();
List<ListTask> list = new List();
List<Task> overdue = new List();
List<Task> total = new List();
Task dismissed;
TimeOfDay endOfDay = TimeOfDay(hour: 23, minute: 59);
bool makeNewOne = false;
int makeNewOneIndex;


class Task {
  final String title;
  final String note;
  final DateTime dateAndTime;
  final String color;
  final String tag;
  final bool priority;

  String get getTitle {
    return title;
  }

  String get getNote {
    return note;
  }

  DateTime get getDate {
    return DateTime(dateAndTime.year, dateAndTime.month, dateAndTime.day);
  }

  DateTime get getDateAndTime {
    return dateAndTime;
  }

  Color get getColor {
    if (color == "Red") {
      return Colors.red;
    } else if (color == "Orange") {
      return Colors.orange;
    } else if (color == "Yellow") {
      return Colors.yellow;
    } else if (color == "Green") {
      return Colors.green;
    } else if (color == "Blue") {
      return Colors.blue;
    } else if (color == "Purple"){
      return Colors.purple;
    } else {
      return Colors.transparent;
    }
  }

  String get strColor {
    if (color == null) {
      return "N/A";
    } else {
      return color;
    }
  }

  String get getTag {
    return tag;
  }

  bool get getPriority {
    return priority;
  }

  Task(this.title, this.note, this.dateAndTime, this.color, this.tag, this.priority);
}


class ListTask{
  DateTime date;
  List<Task> list;

  DateTime get getDate {
    return date;
  }

  List<Task> get getTasks {
    return list;
  }

  ListTask(this.date, this.list);
}


void getMap() {
  map.clear();
  int limit = 23; //21 days is 3 weeks, plus today, plus anything overdue
  for(int i = 0; i < items.length; i++) {
    var value = items[i];
    DateTime key = value.getDate;
    //print(key);
    //List<Task> listTemp = map[key];
    List<Task> temp = new List();
//    temp.add(value);
//    map[key] = temp;

    if (map.containsKey(key)) {
      temp = map[key];
      temp.add(value);
    } else {
      temp.add(value);
      map[key] = temp;
    }

    //var current = listTemp.add(value);
//    map[key].add(value);

    //map.update(key, (v) => current, ifAbsent: () => current);
//    print(key);
//    print(map.containsKey(key));
//    List<Task> listTemp = map[key];
//    print(listTemp);

    //map.update(key, (v) => , ifAbsent: () => new List(items[i]));
    //List<Task> temp = map[key].values;
//    if(map.containsKey(items[i].getDateAndTime)) {
//      List<Task> temp = map.
//      map.addEntries(key, items[i]);
//    }
  }
}


void addToMap(Task value) {
  DateTime key = value.getDate;
  DateTime time = value.getDateAndTime;
  List<Task> temp = new List();

  if (map.containsKey(key)) {
    temp = map[key];
    temp.add(value);
  } else {
    temp.add(value);

//    var keys = map.keys;
//    for(int i = 0; i < keys.length; i++) {
//
//    }


//    List<dynamic> list = new List();
//    list = map.entries.map((e) => ListTask(e.key, e.value)).toList();
//    print(list);


    //for(int i = 0; i < )

    //adding to map
    map[key] = temp;
  }

}


void addToList(Task task) {
  DateTime date = task.getDate;

  if (list.length == 0) {
    List<Task> newList = new List();
    newList.add(task);
    list.insert(0, ListTask(date, newList));
  } else {
    bool b = false;
    for (int i = 0; i < list.length; i++) {
      DateTime temp = list[i].getDate;
      if (date.compareTo(temp) == 0) {
        List<Task> currentList = list[i].getTasks;
        print("CURRENT: " + currentList.toString());
        bool b1 = false;
        for (int j = 0; j < currentList.length; j++) {
          if (task.getDateAndTime.compareTo(currentList[j].getDateAndTime) < 0) {
            currentList.insert(j, task);
            b1 = true;
            break;
          }
        }
        if (!b1) {
          currentList.add(task);
        }
        b = true;
        break;
      } else if (date.compareTo(temp) < 0) {
        List<Task> newList = new List();
        newList.add(task);
        list.insert(i, ListTask(date, newList));
        b = true;
        break;
      }
    }
    if (!b) {
      List<Task> newList = new List();
      newList.add(task);
      list.insert(list.length, ListTask(date, newList));
    }
  }

//  for (int i = 0; i < list.length; i++) {
//    if (list[i].getTasks.length > 0) {
//      for (int j = 0; j < list[i].getTasks.length; j++) {
//        print("LIST: " + list[i].getDate.toString() + " " + list[i].getTasks.toString() + " THE DATE: " + list[i].getTasks[j].getDateAndTime.toString() + " THE TITLE: " + list[i].getTasks[j].getTitle);
//      }
//    } else {
//      print("LIST: " + list[i].getDate.toString() + " " + list[i].getTasks.toString() + " THE DATE: " + list[i].getTasks[0].getDateAndTime.toString());
//    }
//    print("LIST: " + list[i].getDate.toString() + " " + list[i].getTasks.toString());
//  }

//  print("here it goes... " + list);

//  if (list.)
  //var temp = ListTask(date, task);
  //print("TEMP: " + temp.getTasks.toString());


}


void getList() {
  print("len: " + list.length.toString());
  DateTime before = DateTime.now().subtract(Duration(days: 1));
  if (list.length > 1) {
    DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime key = list[1].getDate;
    print(key);
//    int i = 0;
//
//
//    while (key.compareTo(now) < 0) {
//      List<Task> current = list[i].getTasks;
//      for (int j = 0; j < current.length; j++) {
//        overdue.add(current[j]);
//      }
//      list.removeAt(i);
//      i++;
//      key = list[i].getDate;
//    }
//    key = DateTime(list[0].getDate.year, list[0].getDate.month, list[0].getDate.day);
//    //DateTime hourKey = DateTime(list[0].getDate.hour, list[0].getDate.minute);
//    DateTime nowTime = DateTime(DateTime.now().hour, DateTime.now().minute);
//    if (key == now) {
//      int deleted = 0;
//      List<Task> current = list[0].getTasks;
//      for (int i = 0; i < current.length; i++) {
//        if (DateTime(current[i].getDateAndTime.hour, current[i].getDateAndTime.minute).compareTo(nowTime) <= 0) {
//          overdue.add(current[i]);
//          deleted++;
//        }
//      }
//      print("deleted" + deleted.toString());
//      if (deleted == current.length) {
//        list.removeAt(0);
//      } else {
//        current.removeRange(0, deleted);
//      }
//    }



    if (key.compareTo(now) < 0) {
      List<Task> current = list[1].getTasks;
      for (int j = 0; j < current.length; j++) {
        overdue.add(current[j]);
      }
      list.removeAt(1);
    }
    if (key.compareTo(now) == 0) {
      List<Task> current = list[1].getTasks;
      int deleted = 0;
      for (int j = 0; j < current.length; j++) {
        if (current[j].getDateAndTime.compareTo(DateTime.now()) <= 0) {
          overdue.add(current[j]);
          deleted++;
        }
      }
      print("deleted" + deleted.toString());
      if (deleted == current.length) {
        print("yes");
        list.removeAt(1);
      } else {
        current.removeRange(0, deleted);
      }
    }

//    if (list.length == 0) {
//      list.add(ListTask(before, overdue));
//    } else {
//      list.insert(0, ListTask(before, overdue));
//    }
    list.removeAt(0);
    list.insert(0, ListTask(before, overdue));

//    list.add(ListTask(before, overdue));
  //list.add(ListTask(before, overdue));
  } else if (list.length == 0) {
    list.add(ListTask(before, overdue));
  } else if (list.length == 1) {
    print("FINALLY");
  }
  print("......................................." + list.toString());
  print("overdue: " + overdue.toString());
  print("len after: " + list.length.toString());


//  if (list.length > 0) {
//    while (list[0].getDate.compareTo(DateTime.now()) < 0) {
//      List<Task> currentList = list[0].getTasks;
//      int totalDeleted = 0;
//      for (int j = 0; j < currentList.length; j++) {
//        overdue.add(currentList[j]);
//      }
//      if (totalDeleted == currentList.length) {
//        list.removeAt(0);
//      }
//    }
//    if (list[0].getDate.compareTo(DateTime.now()))
//    while (list[0].getDate.compareTo(DateTime.now()) < 0) {
//      List<Task> currentList = list[0].getTasks;
//      int totalDeleted = 0;
//      for (int j = 0; j < currentList.length; j++) {
//        overdue.add(currentList[j]);
//      }
//      if (totalDeleted == currentList.length) {
//        list.removeAt(0);
//      }
//    }
//  }
}


void mergeTasks() {
  getList();
  print("                             " + list.toString());
}


void getAllTasks() {
  getList();
  total.addAll(overdue);
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i].getTasks.length; j++) {
      total.add(list[i].getTasks[j]);
    }
  }
}


String formatDate(DateTime date) {
  DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  if (now == date) {
    return "Today";
  } else if (now.add(Duration(days: 1)) == date) {
    return "Tomorrow";
  } else if (now.year == date.year){
    return DateFormat("MMMMEEEEd").format(date);
  } else {
    return DateFormat("MMMM d, yyyy").format(date);
  }
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
  isPriority = false;
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
bool isPriority = false;

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
