import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// page 1
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: Text('page 1'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Center(
              child: Column (
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'pageHome');
                    },
                    color: Colors.grey,
                    child: Text(
                      'to home page',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/page2');
                    },
                    color: Colors.grey,
                    child: Text(
                      'to page 2',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 10,
//                            offset: Offset(-1,1),
                          )
                        ]
                    ),
                    child: AlertDialog(
                      title: Text('Hint'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Are you sure?\n'
                                'action can not be reversed!')
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('yes'),
                          textColor: Colors.black,
                          color: Colors.grey,
                          onPressed: (){},
                        ),
                        FlatButton(
                          child: Text('no'),
                          textColor: Colors.black,
                          color: Colors.grey,
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                  SimpleDialog(
                    title: Text('simple dialog demo'),
                    children: <Widget>[
                      SimpleDialogOption(
                        child: Text('option 1'),
                      )
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
