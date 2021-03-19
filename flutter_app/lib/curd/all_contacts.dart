import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/curd/people.dart';
import 'package:sqflite/sqflite.dart';
import 'add_new_contact.dart';
import 'db_helper.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactListState();
  }
}

class ContactListState extends State<ContactList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<People> contactList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = <People>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: getContactListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(People(null, '', '', '', 0), 'Add Contact');
        },
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getContactListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  getGenderColor(this.contactList[position].gender),
              child: Icon(Icons.person),
            ),
            title: Text(
              this.contactList[position].firstName +
                  this.contactList[position].lastName,
              style: titleStyle,
            ),
            subtitle: Text(this.contactList[position].mobile),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, contactList[position]);
              },
            ),
            onTap: () {
              navigateToDetail(this.contactList[position], 'Edit Contact');
            },
          ),
        );
      },
    );
  }

  // Returns the priority color
  Color getGenderColor(int gender) {
    switch (gender) {
      case 0:
        return Colors.red;
        break;

      default:
        return Colors.pink;
    }
  }

  void _delete(BuildContext context, People people) async {
    int result = await databaseHelper.deleteContact(people.id);
    if (result != 0) {
      _showSnackBar(context, 'Contact Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(People people, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContactDetail(people, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<People>> contactListFuture = databaseHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }
}
