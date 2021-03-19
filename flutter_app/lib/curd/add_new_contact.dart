import 'package:flutter/material.dart';
import 'package:flutter_app/curd/people.dart';
import 'db_helper.dart';

class ContactDetail extends StatefulWidget {
  final String appBarTitle;
  final People people;

  ContactDetail(this.people, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ContactDetailState(this.people, this.appBarTitle);
  }
}

class ContactDetailState extends State<ContactDetail> {
  static var _gender = ['Male', 'Female'];
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  People people;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  ContactDetailState(this.people, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    firstNameController.text = people.firstName;
    lastNameController.text = people.lastName;
    mobileController.text = people.mobile;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Write some code to control things, when user press back button in AppBar
              moveToLastScreen();
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // First element
            ListTile(
              title: DropdownButton(
                  items: _gender.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: textStyle,
                  value: getGenderAsString(people.gender),
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      updateGenderAsInt(valueSelectedByUser);
                    });
                  }),
            ),

            // Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: firstNameController,
                style: textStyle,
                onChanged: (value) {
                  updateFirstName();
                },
                decoration: InputDecoration(
                    labelText: 'FirstName',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: lastNameController,
                style: textStyle,
                onChanged: (value) {
                  updateLastName();
                },
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: mobileController,
                style: textStyle,
                onChanged: (value) {
                  updateMobile();
                },
                decoration: InputDecoration(
                    labelText: 'Mobile',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _save();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _delete();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updateGenderAsInt(String value) {
    switch (value) {
      case 'Male':
        people.gender = 0;
        break;
      case 'Female':
        people.gender = 1;
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String getGenderAsString(int value) {
    String gender;
    switch (value) {
      case 0:
        gender = _gender[0];
        break;
      case 1:
        gender = _gender[1];
        break;
    }
    return gender;
  }

  void updateFirstName() {
    people.firstName = firstNameController.text;
  }

  void updateLastName() {
    people.lastName = lastNameController.text;
  }

  void updateMobile() {
    people.mobile = mobileController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    int result;
    if (people.id != null) {
      // Case 1: Update operation
      result = await helper.updateContact(people);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertContact(people);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Contact Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Contact');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (people.id == null) {
      _showAlertDialog('Status', 'No Contact was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteContact(people.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Contact Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occurred while Deleting Contact');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
