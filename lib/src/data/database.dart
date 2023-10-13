import 'package:hive_flutter/hive_flutter.dart';

class ToDoListDatabase {
  List toDoList = [];

  // Reference the box
  final _todoListBox = Hive.box("todolist_box");

  // This method is run, if this is the first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Task example", false],
      ["Do Laundry", false]
    ];
  }

  void loadData() {
    toDoList = _todoListBox.get("TODOLIST");
  }

  void updateDatabase() {
    _todoListBox.put("TODOLIST", toDoList);
  }
}