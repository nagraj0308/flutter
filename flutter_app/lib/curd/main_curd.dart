import 'package:flutter/material.dart';
import 'all_contacts.dart';

void mainCurd() {
  runApp(MyContacts());
}

class MyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContactList',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ContactList(),
    );
  }
}
