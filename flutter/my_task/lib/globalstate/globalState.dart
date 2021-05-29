import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MyTask {
  final int id;
  final String title;

  MyTask({required this.id, required this.title});
}

class GState with ChangeNotifier {
  static const url = 'http://192.168.137.56:8000/api/v1/';

  List<MyTask> _mytasks = [];

  Future<void> getMytasksData() async {
    http.Response response = await http.get(Uri.parse(url));

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
    }
  }
}
