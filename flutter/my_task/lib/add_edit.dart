import 'package:flutter/material.dart';
import 'package:my_task/globalstate/globalState.dart';
import 'package:provider/provider.dart';

class AddEditScreen extends StatefulWidget {
  static const routeName = '/add-edit';
  final int? id;

  AddEditScreen([this.id]);
  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.id != null) {
      MyTask oldMytask =
          Provider.of<GState>(context, listen: false).singleTask(widget.id!);
      _textController.text = oldMytask.title;
    }
    super.didChangeDependencies();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _addTask() {
    if (_textController.text.length <= 6) {
      return;
    }

    if (widget.id != null) {
      Provider.of<GState>(context, listen: false)
          .updateTask(widget.id!, _textController.text);
    } else {
      print(_textController.text);
      Provider.of<GState>(context, listen: false)
          .addNewTask(_textController.text);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? "Edit Task" : "Add Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Add new task",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addTask();
              },
              child: Text(widget.id != null ? "Edit Task" : "Add Task"),
            )
          ],
        ),
      ),
    );
  }
}
