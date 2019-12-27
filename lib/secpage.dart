import 'package:flutter/material.dart';

class SecPage extends StatefulWidget {
  final String email,pass;
  SecPage(this.email,this.pass); 
  @override
  _SecPageState createState() => _SecPageState(this.email,this.pass);
}

class _SecPageState extends State<SecPage> {
  final String email,pass;
  _SecPageState(this.email,this.pass);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Text(
          "Nama mu : ${this.email} \n Password mu: ${this.pass}"),
      ),
    );
  }
}