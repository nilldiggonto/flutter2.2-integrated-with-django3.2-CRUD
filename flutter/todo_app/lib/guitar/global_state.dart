import 'package:flutter/cupertino.dart';

class GuitarState with ChangeNotifier {
  List<String> _datas = ["guitar 1", "guitar 2", "guitar 3"];

  List<String> get data {
    return [..._datas];
  }

  void addData(String data) {
    _datas.insert(0, data);
    notifyListeners();
  }
}
