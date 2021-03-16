import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/db_helper.dart';

import 'contact.dart';

class Curd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurdState();
  }
}

class CurdState extends State<Curd> {
  ContactHelper _contactHelper = ContactHelper();
  String _firstName;
  String _lastName;
  String _mobile;
  bool _gender;

  @override
  void initState() {
    _contactHelper.initializeDatabase().then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Database Initialised !!"))),
        });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (String value) {
        if (value.isEmpty) return 'First Name is required !';
        return null;
      },
      onSaved: (String value) {
        _firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (String value) {
        if (value.isEmpty) return 'Last Name is required !';
        return null;
      },
      onSaved: (String value) {
        _lastName = value;
      },
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Mobile'),
      validator: (String value) {
        if (value.isEmpty) return 'Mobile is required !';
        return null;
      },
      onSaved: (String value) {
        _mobile = value;
      },
    );
  }

  Widget _buildGender() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Gender'),
      validator: (String value) {
        if (value.isEmpty) return 'Gender is required !';
        return null;
      },
      onSaved: (String value) {
        if (value == 'M') {
          _gender = true;
        } else {
          _gender = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curd Demo')),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                _buildMobile(),
                _buildGender(),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => {
                    if (!_formKey.currentState.validate())
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Toast msg"))),
                      }
                    else
                      {
                        _contactHelper.insertContact(Contact(
                          id: 1,
                          firstName: _firstName,
                          lastName: _lastName,
                          mobile: _mobile,
                          gender: _gender,
                        )),
                      }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
