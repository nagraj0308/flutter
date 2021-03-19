import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Long View")),
      body: getLongListView(context),
    );
  }
}

Widget getLongListView(BuildContext context) {
  var listElements = getListElements();
  var longListView = ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.laptop),
        title: Text(listElements[index]),
        subtitle: Text("Sunny"),
        trailing: Icon(Icons.wine_bar),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Item : " + listElements[index] + "deleted"),
            action: SnackBarAction(
              label: "UNDO",
              onPressed: () {},
            ),
          ));
        },
      );
    },
  );
  return longListView;
}

List<String> getListElements() {
  return List<String>.generate(1000, (index) => "Item $index");
}
