import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:todo_app/add_data.dart';
import 'package:todo_app/guitar/global_state.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<void> getData() async {
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   await http.get(Uri.parse(url)).then((response) {
  //     // print(response.body);
  //     var data = json.decode(response.body);
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  List<dynamic> posts = [];

  Future<void> getData() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        posts = data;
      });
      // print(response.body);
    }
  }

  @override
  void didChangeDependencies() {
    getData();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final getData = Provider.of<GuitarState>(context).data;
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
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${posts[index]['title']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
