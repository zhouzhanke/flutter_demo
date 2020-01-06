import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextEditingController controller1 = TextEditingController();
    controller1.addListener(() {
      print('Input: ${controller1.text}');
    });

    return new Scaffold(
      appBar: new AppBar(
        title: Text('page 2'),
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
                      Navigator.pushNamed(context, '/page1');
                    },
                    color: Colors.grey,
                    child: Text(
                      'to page 1',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: controller1,
                      maxLength: 30,
                      maxLines: 1,
                      autocorrect: true,
                      autofocus: false,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (text) {
                        print('on change $text');
                      },
                      onSubmitted: (text){
                      },
                      enabled: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        helperText: 'text',
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
