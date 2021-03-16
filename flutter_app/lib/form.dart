import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _firstName;
  String _lastName;
  String _age;
  String _gender;

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

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      validator: (String value) {
        if (value.isEmpty) return 'Age is required !';
        return null;
      },
      onSaved: (String value) {
        _age = value;
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
      appBar: AppBar(title: Text('Form Demo')),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                _buildAge(),
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
                  },
                ),
              ],
            )),
      ),
    );
  }
}
