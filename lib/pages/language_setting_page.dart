import 'package:flutter/material.dart';

/// TODO: language change
/// language setting page
class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('language setting'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('demo'),
            )
          ],
        )
    );
  }
}
