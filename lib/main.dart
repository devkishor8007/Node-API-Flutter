import 'package:flutter/material.dart';
import 'package:flutter_node/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.redAccent, scaffoldBackgroundColor: Colors.red),
      home: HomePage(),
    );
  }
}
