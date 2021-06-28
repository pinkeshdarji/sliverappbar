import 'package:flutter/material.dart';
import 'package:sliverappbar/sliverappbar_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar Demo',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: SliverAppBarStatus(),
    );
  }
}
