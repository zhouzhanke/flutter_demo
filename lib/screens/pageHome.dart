import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  double sideLength = 100;

  // increment counter function
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print('counter increment by 1! it is $_counter now!');
  }

  // reset counter function
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    print('counter reset!');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: new Border.all(
                width: 5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'opacity demo',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Text(
                  ' You have pushed the button this many times: '
                      '\n$_counter',
                  style: Theme.of(context).textTheme.display1,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: 5,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: _incrementCounter,
                        child: Text('+1'),
                      ),
                    ),
                    // reset counter test button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: _resetCounter,
                        child: Text('Reset'),
                      ),
                    ),

                    // reset counter test icon
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.all_inclusive),
                        tooltip: 'icon',
                        onPressed: () {
                          setState(() {
                            _counter = Random().nextInt(100 + 1);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // switch page
          RaisedButton(
            onPressed: () => Navigator.pushNamed(context, '/page1'),
            child: Text('switch page demo'),
          ),

          SizedBox(
            height: 10,
          ),

          // inkwell sample
          AnimatedContainer(
            height: sideLength,
            width: sideLength,
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: Material(
              color: Colors.deepOrange,
              child: InkWell(
                child: Center(
                  child: Text(
                    'Tap me',
                  ),
                ),
                onTap: () {
                  setState(() {
                    sideLength == 100 ? sideLength = 200 : sideLength = 100;
                  });
                },
              ),
            ),
          ),
          CupertinoButton(
            child: Text('IOS button'),
            pressedOpacity: .5,
            color: Colors.grey,
//            padding: const EdgeInsets.all(10), // shrink to text size
            onPressed: () {},
          ),
//          CupertinoActivityIndicator(
//            radius: 30,
//            animating: true,
//          )
        ],
      ),
    );
  }
}
