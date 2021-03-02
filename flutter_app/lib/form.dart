import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) return 'Name is required !';
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLastName() {
    return Text('Chaudhary');
  }

  Widget _buildAge() {
    return Text('24');
  }

  Widget _buildGender() {
    return Text('Male');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Demo')),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
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
              onPressed: () => {},
            ),
          ],
        )),
      ),
    );
  }
}
