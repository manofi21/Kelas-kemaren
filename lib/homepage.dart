import 'package:flutter/material.dart';

import 'secpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final forKey = GlobalKey<FormState>();
    RegExp forEmail = RegExp("[a-zA-Z0-9_.+-]+@gmail+\\.[a-zA-Z0-9]");
    RegExp forPass = RegExp(r"^[a-zA-Z0-9_]*$",caseSensitive: false);
    String email,pass;
    return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("login Page"),
          ),
          body: Container(
            decoration: BoxDecoration(
              //jumlah stop berbanding lurus dengan jumlah warna
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                //jumlah stop berbanding lurus dengan jumlah warna
                stops: [0.3, 0.6, 0.9],
                colors: [
                  Color.fromRGBO(12, 235, 235, 1),
                  Color.fromRGBO(32, 227, 178, 1),
                  Color.fromRGBO(41, 255, 198, 1),
                ],
              ),
            ),
            child: Container(
              //isi child: Container
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    //jumlah stop berbanding lurus dengan jumlah warna
                    stops: [0.3, 0.6, 0.9],
                    colors: [
                      Color.fromRGBO(12, 235, 235, 1),
                      Color.fromRGBO(32, 227, 178, 1),
                      Color.fromRGBO(41, 255, 198, 1),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 18.0,
                        color: Colors.transparent.withOpacity(.5),
                        spreadRadius: 12.5),
                  ]),
              margin: EdgeInsets.fromLTRB(40, 35, 40, 50),
              child: Column(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 45, top: 15),
                    child: Form(
                      key: forKey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: 'Roboto-Italic',
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                            child: Column(
                              children: <Widget>[
                                Text("Email"),
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 8),
                                  child: TextFormField(
                                    validator: (String nilai){
                                      if(nilai.isEmpty){
                                        return 'Enter some text';
                                      }else if(nilai.length < 10){
                                        return 'Your input Less than 10';
                                      }else if(!(forEmail.hasMatch(nilai))){
                                        return 'Tidak sesuai validasi';
                                      }
                                    },onSaved: (String value){
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Icon(Icons.message),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(28))),
                                  ),
                                ),
                                Text("Password"),
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 8),
                                  child: TextFormField(
                                    validator: (String nilai){
                                      if(nilai.isEmpty){
                                        return 'Enter some text';
                                      }else if(nilai.length < 10){
                                        return 'Your input Less than 10';
                                      }else if(!(forPass.hasMatch(nilai))){
                                        return 'Tidak sesuai validasi';
                                      }
                                    },onSaved: (String value){
                                      pass = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Sign In'),
                                  onPressed: () {
                                    if(forKey.currentState.validate()){
                                      forKey.currentState.save();
                                      Navigator.push(context,MaterialPageRoute(
                                        builder: (context) => SecPage(email,pass)
                                      ));
                                    }
                                  },
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.black12,
                                  child: Text('Forgot password'),
                                  onPressed: () {

                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
          ),
        );
  }
}