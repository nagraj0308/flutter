import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/curd/db_helper.dart';

class AllContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_app',
      home: Scaffold(
        appBar: AppBar(
          title: Text("All Contacts"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.pushNamed(context, '/second')),
          ],
        ),
        body: Material(
            color: Colors.amber,
            child: Center(
              child: Text('helo'),
            )),
      ),
    );
  }
}
