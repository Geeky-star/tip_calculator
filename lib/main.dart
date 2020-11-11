import 'package:flutter/material.dart';
import 'package:tip_calculator/dropdown.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final people = TextEditingController();
  final bill = TextEditingController();

  @override
  void dispose() {
    people.dispose();
    bill.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: 350,
          child: Column(
            children: <Widget>[
              Text(
                "Tip Calculator",
                style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("How much was your bill?",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
              Container(
                height: 100,
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: bill,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Total bill'),
                ),
              ),
              Text("How was your service?"),
              Container(
                child: Dropdown(),
              ),
              Text("How many people are sharing the bill?"),
              Container(
                height: 100,
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: people,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number of People'),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                   
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Your tip is: "),
                        content: Text((int.parse(bill.text) /
                                (int.parse(people.text) *
                                50))
                            .toString()),
                      );
                    },
                  );
                },
                color: Colors.red[900],
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
