import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/guitar/add_data.dart';
import 'package:todo_app/guitar/global_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<GuitarState>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Guitar Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/add');

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => AddData(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: getData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${getData[index]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
