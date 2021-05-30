import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MyTask {
  final int id;
  final String title;

  MyTask({required this.id, required this.title});
  // print('okok');
}

class GState with ChangeNotifier {
  static const url = 'http://192.168.137.56:8000/api/v1/';
  // print(url);

  List<MyTask> _mytasks = [];
  // print('change');

  Future<void> getMytasksData() async {
    // print('okokok');
    // print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));
      // print(response.body);
      // print('response.body');
      // print(url);
      if (response.statusCode == 200) {
        // print(response.body);
        var data = json.decode(response.body) as List;
        List<MyTask> getMytask = [];
        data.forEach((element) {
          MyTask myTask = MyTask(id: element['id'], title: element['title']);
          getMytask.add(myTask);
        });
        _mytasks = getMytask;

        notifyListeners();
      } else {
        print('server error');
        // print('server error');
        // print('server error');
        // print('server error');
      }
    } catch (e) {
      print(e);
    }

    // print('naything');
  }

  List<MyTask> get mytasks {
    return [..._mytasks];
    // return ;
  }
}
