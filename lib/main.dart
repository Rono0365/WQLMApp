import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'logincred.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // rono.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: logincred2(), //MyHomePage(title: 'Thiwasco'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var value;
  var timestamp;
  var name;
  var id;
  var value2;
  var value3;
  var valuey;
  var valuez;
  var height;
  var timestamp2;
  var timestamp1;
  var name2;
  var id2;
  var eht ;
  var turbidity;
  var pH;
  var Temperature;
  
  var turbidity2;
  var pH2;
  var Temperature2;
  var vol2;
  int _counter = 0;
  
  
    Future getWeather() async {
    //String token = widget.token.toString();
    //print(token);
    //print(widget.token); wasn't easy but never stopped
    /*var headers = {
      'Authorization': 'Token $token',
    };*/
    final responsex = await http.get(
      Uri.parse('https://api.thingspeak.com/channels/1294014/feeds.json?results=2'),
    ); //headers: headers
    final responsev = await http.get(
      Uri.parse('https://api.thingspeak.com/channels/1302630/feeds.json?results=2'),
      // Send authorization headers to the backend.
    );
    final responsey = await http.get(
      Uri.parse('https://api.waziup.io/api/v2/devices/0242ac1200028b29/sensors/analogInput_1'),
      // Send authorization headers to the backend.
    );
    final responsez = await http.get(
      Uri.parse('https://api.waziup.io/api/v2/devices/0242ac1200028b29/sensors/analogInput_2'),
      // Send authorization headers to the backend.
    );
     //headers: headers
    //http.Response responsex = await http
    //  .get(Uri.parse('http://192.168.100.20:8000/id/1/')); //get via token
     //get via token headers: headers

    var results = jsonDecode(responsev.body); //returns json body from api
    var resultx = jsonDecode(responsex.body);
    var resulty = jsonDecode(responsey.body);
    var resultz = jsonDecode(responsez.body);
    
    setState(() {
      this.value = results;
      this.value2 = resultx;
      this.valuey = resulty;
      this.valuez = resultz;
      //this.height = value['value'][0]['value'];
      print(value.toString());
      print(value2.toString());
      print(valuey.toString());
      print(valuez.toString());
    });
    setState(() {//kiganjo
        this.turbidity = value['feeds'][0]['field3'];
        this.pH = value['feeds'][0]['field2'];
        this.turbidity2 = value2['feeds'][0]['field1'];
        this.pH2 = value2['feeds'][0]['field2'];
        
        this.value2 = resulty['value']['value'];
        this.value3 = resultz['value']['value'];
        this.timestamp1 = resultz['value']['timestamp'];
        
        this.timestamp2 = resulty['value']['timestamp'];
        this.name2 = resulty['name'];
        this.id2 = resulty['id'];
        print(turbidity.toString());
       });
    

    //print(value.toString());
  }

  /*
  Future getWeather2() async {
    
    http.Response responsev1 = await http.get(
        'https://api.thingspeak.com/channels/1294014/feeds.json?results=2');
    http.Response responsev2 = await http.get(
        'https://api.thingspeak.com/channels/1302630/feeds.json?results=2');  
    var result5 = jsonDecode(responsev2.body);
    //var results = jsonDecode(responsev.body); //returns json body from api
    var resultsX = jsonDecode(responsev1.body); //returns json body from api
    setState(() {//kiganjo
        this.turbidity = result5['feeds']['field3'];
        this.pH = result5['feeds']['field2'];
   
       });
  }

  Future getWeather() async {
    http.Response responsev1 = await http.get(
        'https://api.thingspeak.com/channels/1294014/feeds.json?results=2');
    http.Response responsev2 = await http.get(
        'https://api.thingspeak.com/channels/1302630/feeds.json?results=2');  
    var result5 = jsonDecode(responsev2.body);//iganj
    //var results = jsonDecode(responsev.body); //returns json body from api
    var resultsX = jsonDecode(responsev1.body); //returns json body from api
    setState(() {//kiganjo
        this.turbidity = result5['feeds']['field3'];
        this.pH = result5['feeds']['field2'];
       });
    
    setState(() {
      this.value2 = resultsX['value']['value'];
      this.timestamp2 = resultsX['value']['timestamp'];
      this.name2 = resultsX['name'];
      this.id2 = resultsX['id'];
    });
  }*/

  @override
  void initState() {
    super.initState();
     this.getWeather();
     //this.getWeather2();
     
     
     print("Am here");
   
  }

  Container _buildBottomSheet() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.cyan, width: 2.0)),
      child: Text(
        "Refreshed",
        style: TextStyle(fontSize: 45),
      ),
    );
  }

  Widget build(BuildContext context) {
    var newx;//var newx = value2 != null ? value:0.0;
    var newx2;//var newx2 = value2 != null ?8.0-value2:0.0;
    var vo1 = value2 != null ?newx: 0.0;//*113.04.round(): 0.0;
    var vo2 = value2 != null ?newx2: 0.0;//*113.04.round(): 0.0;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return value3 != null ?Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      child: Column(
                        children:[ ListTile(
                          onTap: () {
                            Navigator.of(context).pop();
                             Navigator.pop(context);
                            //logincred2
                          },
                          title: Text("Log out"),
                        ),ListTile(
                          onTap: () {
                            // Navigator.of(context).pop();
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => logincred2(),
                              ),
                            );*/
                            //logincred2
                          },
                          title: Text("contact us"),
                          subtitle: Text("0729479340 | WQLMProject@gmail.com"),
                        ),
                        ListTile(
                          onTap: () {
                            // Navigator.of(context).pop();
                           /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => logincred2(),
                              ),
                            );*/
                            //logincred2
                          },
                          title: Text("change password"),
                          //subtitle: Text("0705412626 | nkiprono589@gmail.com"),
                        ),
                        ]
                      ),
                    );
                  });
            },
            icon: Icon(Icons.person)),
        centerTitle: true,
        elevation: 0.0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("WQLM APP"),
        //actions: Icon(Icons.person_outlined),
      ),
      body: SingleChildScrollView(
            child:Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Container(width:MediaQuery.of(context).size.width,child:Center(child:Text("Kisii", style: TextStyle(fontSize: 20))),color:Colors.blue),
           
            Container(height:MediaQuery.of(context).size.width*0.4,width:MediaQuery.of(context).size.width,color:Colors.blue,
            child:SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10.0,
                              children: [
                                
                                Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child:Card(child:Column(children:[ListTile(title:Text("Turbidity")),ListTile(trailing:Text('1.5'))]))),//turbidity2.toString()
                                        Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child:Card(child:Column(children:[ListTile(title:Text("pH")),ListTile(trailing:Text(pH2.toString()))]))),
                                     

                              ])
            )),
           Container(width:MediaQuery.of(context).size.width,child:Center(child:Text("Kiganjo", style: TextStyle(fontSize: 20))),color:Colors.blue),
            Container(height:MediaQuery.of(context).size.width*0.4,width:MediaQuery.of(context).size.width,color:Colors.blue,
            child:SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10.0,
                              children: [
                                Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child:Card(child:Column(children:[ListTile(title:Text("Turbidity")),ListTile(trailing:Text('1.456'))]))),//turbidity.toString()
                                        Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child:Card(child:Column(children:[ListTile(title:Text("pH")),ListTile(trailing:Text(pH.toString()))]))),
                                       

                              ])
            )),
            //title
            SizedBox(
              height: 20,
            ),
            Text(timestamp1.toString()),
            SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CircularPercentIndicator(
                radius: 130.0,
                lineWidth: 5.0,
                percent: value3/10,
                center: new Text("Height"),
                progressColor: Colors.green,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Level of Tank:   $value3"),
                    SizedBox(
                      height: 10,
                    ),
                    
                  ])
            ]),

            SizedBox(
              height: 40,
            ),
            Text(timestamp2.toString()),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CircularPercentIndicator(
                radius: 130.0,
                lineWidth: 5.0,
                percent: value2/10 ,
                center: Text("Height"),
                progressColor: Colors.green,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "Level of Tank: $value2"), //pie times the radius squared is 113.04...so it's this value times the level(height) of water
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                  ])
            ]),
            SizedBox(
              height: 50,
             
            ),
            SizedBox(
              height: 50,
              child:Text("WQLM App.")
            ),
            SizedBox(
              height: 50,
              child:Text("Created by Rono")
            ),
          ],
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  child: Center(
                      child: Text(
                    "Refreshed",
                    style: TextStyle(fontSize: 45),
                  )),
                );
              });
          MyApp();
        },
        child: Icon(Icons.refresh),
      ),*/
    ):Container();
  }
}