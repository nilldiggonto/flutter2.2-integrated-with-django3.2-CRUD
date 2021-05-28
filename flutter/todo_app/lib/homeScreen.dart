import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/guitar/global_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<GuitarState>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Guitar Store'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: getData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Text("${getData[index]}"),
            );
          },
        ),
      ),
    );
  }
}
