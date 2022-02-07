//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'logincred.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataPlug',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'DataPlug'),
    );
  }
}

//rono.ai
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name_proj;
  var el_consp;
  var water_consp;
  var meterread;
  var sky;
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();

  Future getWeather() async {
    http.Response responsev =
        await http.get('http://192.168.100.20:8000/reading/');
    var results = jsonDecode(responsev.body);
    setState(() {
      this.sky = results;
    });
  }

  Future addata() async {
    http.Response responsev =await http.post(
      Uri.parse('http://192.168.100.20:8000/reading/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name_of_project': titleController.text,
        'elect_consumption': titleController1.text,
        'waterconsp': titleController2.text,
        'meterread': titleController3.text,
     
      }),
    );//returns json body from api
    //var resultsX = jsonDecode(responsevX.body); //returns json body from api
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                child: Text("refresh"),
                onTap: () {
                  setState(() {
                    getWeather();
                  });
                })
          ],
          leading: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled:true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height*1.7,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            Chip(
                                label: Text(
                              "Add Card",
                              textAlign: TextAlign.center,
                            )),
                            ListTile(
                              onTap: () {},
                              title: TextField(
                                controller: titleController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //filled: true,
                                  //fillColor: Colors.blueGrey[50],
                                  hintText: 'Enter your Title name',
                                  hintStyle: TextStyle(color: Colors.grey[900]),
                                  //border: OutlineInputBorder(
                                  ///   borderRadius:
                                  //    BorderRadius.circular(25.0)
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                //Navigator.of(context).pop();
                                //Navigator.pop(context);
                                //logincred2
                              },
                              title: TextField(
                                controller: titleController1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //filled: true,
                                  //fillColor: Colors.blueGrey[50],
                                  hintText:
                                      'Enter your current Electricity Consumption',
                                  hintStyle: TextStyle(color: Colors.grey[900]),
                                  //border: OutlineInputBorder(
                                  ///   borderRadius:
                                  //    BorderRadius.circular(25.0)
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                //Navigator.of(context).pop();
                                //Navigator.pop(context);
                                //logincred2
                              },
                              title: TextField(
                                controller: titleController2,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //filled: true,
                                  //fillColor: Colors.blueGrey[50],
                                  hintText:
                                      'Enter your current Water Consumption',
                                  hintStyle: TextStyle(color: Colors.grey[900]),
                                  //border: OutlineInputBorder(
                                  ///   borderRadius:
                                  //    BorderRadius.circular(25.0)
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                //Navigator.of(context).pop();
                                //Navigator.pop(context);
                                //logincred2
                              },
                              title: TextField(
                                controller: titleController3,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  //filled: true,
                                  //fillColor: Colors.blueGrey[50],
                                  hintText: 'Enter your Meter Read',
                                  hintStyle: TextStyle(color: Colors.grey[900]),
                                  //border: OutlineInputBorder(
                                  ///   borderRadius:
                                  //    BorderRadius.circular(25.0)
                                ),
                              ),
                            ),
                            ListTile(
                                onTap: () {
                                  //Navigator.of(context).pop();
                                  //Navigator.pop(context);
                                  //logincred2
                                },
                                title: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                      addata();  
                                      });
                                      Navigator.pop(context, "This string will be passed back to the parent",);
                                    },
                                    child: Text("Add Card"))),
                          ]),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.add)),
          centerTitle: true,
          elevation: 0.0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: InkWell(
            child: Text(widget.title),
            onTap: () {
              getWeather();
            },
          ),
          //actions: Icon(Icons.person_outlined),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: sky == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: sky.toList().length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                            elevation: 0.1,
                            color: Colors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: SingleChildScrollView(
                                  child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      sky[index]['name_of_project'].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ListTile(
                                      title: Text(
                                        "Electricity Consumption",
                                      ),
                                      trailing: Chip(
                                        label: Text(
                                          sky[index]['elect_consumption']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ListTile(
                                      title: Text(
                                        "Water Consumption",
                                      ),
                                      trailing: Chip(
                                        label: Text(
                                          sky[index]['waterconsp'].toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ListTile(
                                      title: Text(
                                        "Meter Read",
                                      ),
                                      trailing: Chip(
                                        label: Text(
                                          sky[index]['meterread'].toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ListTile(
                                      title: Text(
                                        "Bill",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Chip(
                                        backgroundColor:
                                            Colors.red.withOpacity(0.2),
                                        label: Text(
                                          "200",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            )),
                      );
                      //color: Colors.amber,
                    })));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
