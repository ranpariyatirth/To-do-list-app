import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
   ToDoList({super.key, required this.taskname, required this.taskcomplted,required this.onChanged});

  final String taskname;
  final bool taskcomplted;
  Function(bool?)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Container(
        margin: EdgeInsets.all(3),
        height: 98,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.white,
            spreadRadius: 15,
          )],
          borderRadius: BorderRadius.circular(15),

      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //task name
            Center(child: Text(taskname)),
            //check box
            Center(child: Checkbox(value: taskcomplted , onChanged: onChanged)),

          ],
        ),
      ),
    );
  }
}