//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

//http://18.185.55.17/api/auth/activation
class logincred2 extends StatefulWidget {
  const logincred2({Key? key}) : super(key: key);

  @override
  _logincred2State createState() => _logincred2State();
}

class _logincred2State extends State<logincred2> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController xc2 = TextEditingController();
  TextEditingController xc3 = TextEditingController();
  TextEditingController xc4 = TextEditingController();
  TextEditingController xc5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool fab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    String user;
    String email;
    String password;
    String verification_phone;
    String role;
    //String email;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: !fab
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              FloatingActionButton.extended(
                backgroundColor: Colors.yellow,
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(title: 'Thiwasco'),
                      ),
                    );
                  });

                  setState(() {
                    usernameController.clear();
                    xc3.clear();
                  });
                },
                //icon: Icon(Icons.transit_enterexit),
                label: Text(
                  "Log in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[900]),
                ),
              ),

              //: Container(),
            ])
          : Container(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Enter Account"),
        elevation: 0.0,
        backgroundColor: Colors.blue.shade50,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade300,
              Colors.blue.shade500
              //hello there rono this is the aimated version of you here speaking
            ],
            stops: [0.1, 0.4, 0.7, 0.9, 1.0],
          ),
        ),
        padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  child: Text(
                    "Thika Water and Sewarage Company",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  // child: Image.asset("assets/greensoko-removebg-preview.png")
                ),
                Container(
                  height: 100,
                  child: Text(
                    "Water is life",
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  // child: Image.asset("assets/greensoko-removebg-preview.png")
                ),
                Container(
                    width: 250,
                    child: Expanded(
                        child: TextField(
                      controller: usernameController,
                      onChanged: (value) {
                        print("tapped");
                        enabled:
                        false;
                      },

                      //void man => value.toString();

                      decoration: InputDecoration(
                          filled: true,
                          icon: Icon(Icons.person_outlined),
                          fillColor: Colors.blueGrey[50],
                          hintText: 'WQLMProject',
                          hintStyle: TextStyle(color: Colors.grey[900]),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      //controller: titleController,
                    ))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 250,
                    child: Expanded(
                        child: TextField(
                      controller: xc3,
                      obscureText: true,
                      onTap: () {
                        /* setState() {
                          fab = false;
                        }*/

                        ;
                        print("tapped");
                      },
                      onChanged: (value) {
                        //
                        enabled:
                        false;
                      },

                      //void man => value.toString();

                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          icon: Icon(Icons.vpn_key),
                          hintText: '**********',
                          hintStyle: TextStyle(color: Colors.grey[900]),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      //controller: titleController,
                    ))),
                SizedBox(
                  height: 270,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
