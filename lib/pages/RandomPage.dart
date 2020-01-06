import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int _res = 6;
  int _input = 6;

  @override
  Widget build(BuildContext context) {

    final TextEditingController controller1 = TextEditingController();
//    controller1.addListener(listener);

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),

            child: Column(
              // center
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TextField(
                    controller: controller1,
                    maxLength: 10,
                    maxLines: 1,
                    autofocus: false,
                    autocorrect: false,
                    obscureText: false,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      filled: true,
                      helperText: 'Input a Integer, then roll the Dice!',
                      prefixIcon: Icon(Icons.thumb_up),
                      hintText: (_input.toString()),
                    ),
                    onChanged: (input){
                      _input = int.parse(input);
                      print('on change: $_input');
                    },
                    onSubmitted: (input){
                      _input = int.parse(input);
                      print('on submit: $_input');
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      _res = Random().nextInt(_input) + 1;
                      print(_res);
                    });
                  },
                  child: Text('Roll'),
                ),
                Text(
                  'You got\n$_res',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
