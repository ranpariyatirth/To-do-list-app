import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'ToDoList.dart';
import 'dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _todoBox = Hive.box('todoBox'); // Access the Hive box

  List<List<dynamic>> toDolist = [];

  @override
  void initState() {
    super.initState();
    loadTasks(); // Load saved tasks when app starts
  }

  void loadTasks() {
    final savedTasks = _todoBox.get('tasks', defaultValue: []);
    setState(() {
      toDolist = List<List<dynamic>>.from(savedTasks);
    });
  }

  void checkboxchange(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
      _todoBox.put('tasks', toDolist); // Save changes to Hive
    });
  }

  void removeTask(int index) {
    setState(() {
      toDolist.removeAt(index);
      _todoBox.put('tasks', toDolist); // Update Hive
    });
  }

  void savenewtask() {
    setState(() {
      toDolist.add([_controller.text, false]);
      _todoBox.put('tasks', toDolist); // Save to Hive
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void Creattask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog(
          controller: _controller,
          onsave: savenewtask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.yellow.shade600,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Creattask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () => removeTask(index), // Double-tap to delete task
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: toDolist[index][1] ? Colors.green.shade300 : Colors.red.shade300, // Green if completed, red if pending
                borderRadius: BorderRadius.circular(10),
              ),
              child: ToDoList(
                taskname: toDolist[index][0],
                taskcomplted: toDolist[index][1],
                onChanged: (value) => checkboxchange(value, index),
              ),
            ),
          );
        },
      ),
    );
  }
}
