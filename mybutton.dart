import 'package:flutter/material.dart';
class mybutton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;

   mybutton({super.key,required this.text,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onpressed,
      child: Text(text,style: TextStyle(color: Colors.white),),
      color: Theme.of(context).primaryColor,

    );

  }
}
