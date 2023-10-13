import 'package:flutter/material.dart';
import 'package:hackday_flutter/src/data/database.dart';
import 'package:hackday_flutter/src/todo/add_item_dialog.dart';
import 'package:hackday_flutter/src/todo/todo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _toDoListBox = Hive.box("todolist_box");
  
  ToDoListDatabase db = ToDoListDatabase();

  final _controller = TextEditingController(); // This controller allows us to get the text from the DialogBox

  @override void initState() {

    if (_toDoListBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void addNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return AddItemDialog(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: closeDialog,
        );
      });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    closeDialog();
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
        backgroundColor: const Color(0xff1B365D),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: const Color(0xff1B365D),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}