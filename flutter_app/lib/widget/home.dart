import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        color: Colors.greenAccent,
        height: 200,
        width: 350,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text(
                "Text",
                textDirection: TextDirection.rtl,
              ),
            ),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonClicked(context);
      },
      child: Text('Click',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white10,
          )),
    );
  }

  void buttonClicked(BuildContext buildContext) {
    var alertDialog = AlertDialog(
      title: Text("hello"),
      content: Text("hai"),
    );
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
