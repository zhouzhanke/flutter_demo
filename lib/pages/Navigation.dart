import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/RandomPage.dart';
import 'package:flutter_app3/pages/page1.dart';
import 'package:flutter_app3/pages/page2.dart';

import 'package:flutter_app3/l10n/localization_intl.dart';
import 'package:flutter_app3/pages/pageHome.dart';

/// home page
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget _buildAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context).title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'search',
          onPressed: () {},
        ),
      ],
    );
  }


//  Widget _buildFloatingButton() {
//    return FloatingActionButton(
//      onPressed: _incrementCounter,
//      tooltip: 'Increment',
//      backgroundColor: Colors.black,
//      child: Icon(Icons.add),
//    ); // This trailing comma makes auto-formatting nicer for build methods.
//  }

  Widget _switch(index) {
    switch (index) {
      case 0:
        return HomePage();
        break;

      case 1:
        return FirstPage();
        break;

      case 2:
        return SecondPage();
        break;

      case 3:
        return RandomPage();
        break;

      default:
        return null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
//      body: _buildBody(),
      body: _switch(_currentIndex),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 1')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 2')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('random')),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
//      floatingActionButton: _buildFloatingButton(),
      // This trailing comma makes auto-formatting nicer for build methods.
      // centralize
//      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class MyDrawer extends StatelessWidget {
//  const MyDrawer({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: new CircleAvatar(
              child: FlutterLogo(),
            ),
            accountName: new Text('my name'),
            accountEmail: new Text('my email@xxxxx.com'),
            otherAccountsPictures: <Widget>[
              new Container(
                child: FlutterLogo(),
              )
            ],
            onDetailsPressed: () {},
          ),
          ListTile(
            leading: new CircleAvatar(
              child: Icon(Icons.language),
            ),
            title: Text('Language Setting'),
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
        ],
      ),
    );
  }

//  Widget _buildMenus() {
//    return ListView(
//      children: <Widget>[
//        ListTile(
//          title: Text('language setting'),
////          onTap: () => Navigator.pushNamed(context, '/language'),
//        )
//      ],
//    );
//  }
}
