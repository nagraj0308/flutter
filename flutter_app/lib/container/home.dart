import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: Text("Text",textDirection: TextDirection.rtl,),
    );
  }

}