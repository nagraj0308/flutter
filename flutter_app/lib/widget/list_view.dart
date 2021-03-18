import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View")),
      body: getListView(context),
    );
  }
}

Widget getListView(BuildContext context) {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Sunny"),
        trailing: Icon(Icons.wb_sunny),
        onTap: (){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Toast msg")));
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop),
        title: Text("Landscape"),
        subtitle: Text("Sunny"),
        trailing: Icon(Icons.wine_bar),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Landscape"),
        subtitle: Text("Sunny"),
        trailing: Icon(Icons.people),
      ),
    ],
  );
  return listView;
}
