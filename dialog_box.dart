import 'package:flutter/material.dart';
import 'package:gdse_gdg/mybutton.dart';
class dialog extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback cancel;

   dialog({super.key, required this.controller,required this.cancel,required this.onsave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller:controller ,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Add description of task.."),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybutton(text: "save", onpressed: onsave,
                ),
                mybutton(text: "canal", onpressed: cancel,
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
