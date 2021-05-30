import 'package:flutter/material.dart';
import 'package:my_task/add_edit.dart';
import 'package:my_task/globalstate/globalState.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // Provider
    Provider.of<GState>(context, listen: false).getMytasksData();
    // print('ok');
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print('hlw world');
    final mystaskData = Provider.of<GState>(context).mytasks;
    // print(mystaskData);

    // print(mystaskData);
    // print(mystaskData);
    // print(mystaskData);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Task App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: mystaskData.length,
          // itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(children: [
                    Text('${mystaskData[index].id}'),
                    // Text('print here'),
                    SizedBox(width: 12),
                    // Text('print here too'),
                    Text(mystaskData[index].title),

                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<GState>(context, listen: false)
                            .deleteTask(mystaskData[index].id);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    )
                  ])),
            );
          },
        ),
      ),
    );
  }
}
