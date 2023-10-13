import 'package:flutter/material.dart';
import 'package:hackday_flutter/src/todo/add_item_dialog.dart';
import 'package:hackday_flutter/src/todo/todo_item.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  final _controller = TextEditingController(); // This controller allows us to get the text from the DialogBox
  
  List todoList = [
    [ "Test 1", false ],
    [ "Test 2", false ]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
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
      todoList.add([ _controller.text, false]);
      _controller.clear();
    });
    closeDialog();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
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
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}