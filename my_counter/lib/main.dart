import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_counter/count_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: StartPage(),
  ));
}

class StartPage extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('main: build()');
    Future<Null> _alert() async {
      return showDialog<Null>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text(
                'Goal number can not be empty',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MyCounter'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration:
                    InputDecoration(hintText: "Type in you goal number"),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
              Container(
                height: 70.0,
                width: 150.0,
                margin: EdgeInsets.only(top: 25.0),
                child: RaisedButton(
                  child: Text('Start'),
                  onPressed: () {
                    if (myController.text.length == 0) {
                      _alert();
                    } else {
                      Navigator
                          .push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Main(int.parse(myController.text))))
                          .then((_) => myController.clear());
                      // myController.clear();
                    }
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
