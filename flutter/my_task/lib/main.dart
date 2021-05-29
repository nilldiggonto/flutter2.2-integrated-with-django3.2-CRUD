import 'package:flutter/material.dart';
import 'package:my_task/add_edit.dart';
import 'package:my_task/globalstate/globalState.dart';
import 'package:my_task/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
        routes: {
          '/': (context) => HomeScreen(),
          AddEditScreen.routeName: (context) => AddEditScreen(),
        },
        // home: Scaffold(
        // appBar: AppBar(
        //   title: Text('My Daily Task'),
        // ),
      ),
    );
  }
}
