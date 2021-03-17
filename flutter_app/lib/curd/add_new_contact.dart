import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/curd/db_helper.dart';

class AddNewContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNewContactState();
  }
}

class AddNewContactState extends State<AddNewContact> {
  ContactHelper _contactHelper = ContactHelper();
  String _firstName;
  String _lastName;
  String _mobile;
  String _gender;

  // List<Contact> _saved;
  // Future<List<Contact>> _contacts;
  // final _biggerFont = const TextStyle(fontSize: 18.0);

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
        _gender = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curd Demo'),
      ),
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
                        // _contactHelper.insertContact(Contact(
                        //   id: 3,
                        //   firstName: _firstName,
                        //   lastName: _lastName,
                        //   mobile: _mobile,
                        //   gender: _gender,
                        // )),
                      }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
