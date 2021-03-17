import 'package:flutter/material.dart';

import 'add_new_contact.dart';
import 'all_contacts.dart';

void mainCurd() {
  runApp(MaterialApp(
    title: 'Contacts',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => AllContacts(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => AddNewContact(),
    },
  ));
}
