import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/guitar/global_state.dart';

class AddData extends StatefulWidget {
  static const routerName = '/add';
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _textControler = TextEditingController();
  void _addData() {
    if (_textControler.text.length <= 0) {
      return;
    } else {
      Provider.of<GuitarState>(context, listen: false).addData(
        _textControler.text,
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Data'),
        ),
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              TextField(
                controller: _textControler,
                decoration: InputDecoration(hintText: 'Add Data'),
              ),
              ElevatedButton(
                onPressed: () {
                  _addData();
                },
                child: Text('add Data'),
              ),
            ])));
  }
}
