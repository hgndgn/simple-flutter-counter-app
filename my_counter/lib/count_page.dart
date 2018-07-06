import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

class Main extends StatefulWidget {
  final int goal;

  Main(this.goal);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  int _counter = 0;

  void increment() {
    setState(() {
      if (++_counter == widget.goal) {
        Vibrate.vibrate();
      }
    });
  }

  void decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minHeight: 100.0, minWidth: 100.0),
                      child: FloatingActionButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          heroTag: null,
                          onPressed: decrement,
                          child: Icon(Icons.exposure_neg_1)),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          _counter.toString() + ' / ' + widget.goal.toString(),
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minHeight: 100.0, minWidth: 100.0),
                      child: FloatingActionButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        onPressed: reset,
                        child: Text('reset'),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 500.0,
                child: RaisedButton(
                  onPressed: increment,
                  child: Icon(
                    Icons.touch_app,
                    size: 61.0,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
