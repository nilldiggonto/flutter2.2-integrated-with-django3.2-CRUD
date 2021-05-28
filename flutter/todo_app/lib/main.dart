import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/guitar/global_state.dart';
import 'package:todo_app/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GuitarState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
