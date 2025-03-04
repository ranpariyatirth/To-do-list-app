import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'myhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('todoBox'); // Open a Hive box for storing tasks
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do App',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(fontFamily:"Schyler"),
    );
  }
}
