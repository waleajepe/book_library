import 'package:book_library/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:book_library/screens/selected_book_screen.dart';
import 'package:book_library/testing.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
