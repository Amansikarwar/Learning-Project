import 'package:flutter/material.dart';
import 'main.dart';

class SecondActivity extends StatefulWidget {
  @override
  State createState() => SecondActivityState();
}

class SecondActivityState extends State {
  var num1, num2;
  var output = 0.0;
  final tColor = Color(0xFFEAF0F1);

  final TextEditingController c1 = TextEditingController(text: "");
  final TextEditingController c2 = TextEditingController(text: "");

  void doAddition() {
    setState(() {
      num1 = double.parse(c1.text);
      num2 = double.parse(c2.text);
      output = num1 + num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = double.parse(c1.text);
      num2 = double.parse(c2.text);
      output = num1 - num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = double.parse(c1.text);
      num2 = double.parse(c2.text);
      output = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = double.parse(c1.text);
      num2 = double.parse(c2.text);
      output = num1 / num2;
    });
  }

  void doClear() {
    setState(() {
      c1.text = "";
      c2.text = "";
      output = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text("Flutter Calculator"),
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Hero(
            tag: 'Logo',
            child: FlutterLogo(
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Output : $output",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: pColor),
                      ),
                    ),
                    elevation: 10,
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Number"),
                  controller: c1,
                ),
                new TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Number"),
                  controller: c2,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30, color: tColor),
                      ),
                      color: pColor,
                      onPressed: doAddition,
                      elevation: 15,
                    ),
                    RaisedButton(
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30, color: tColor),
                      ),
                      color: pColor,
                      onPressed: doSub,
                      elevation: 15,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 30, color: tColor),
                      ),
                      color: pColor,
                      onPressed: doMul,
                      elevation: 15,
                    ),
                    RaisedButton(
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 30, color: tColor),
                      ),
                      color: pColor,
                      onPressed: doDiv,
                      elevation: 15,
                    ),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(fontSize: 25, color: tColor),
                      ),
                      color: pColor,
                      onPressed: doClear,
                      elevation: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
