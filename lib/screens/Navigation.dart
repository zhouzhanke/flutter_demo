import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/screens/cart.dart';
import 'package:flutter_app3/screens/catalog.dart';
import 'RandomPage.dart';
import 'page1.dart';
import 'page2.dart';
import 'pageHome.dart';

import 'package:flutter_app3/l10n/localization_intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget _buildAppBar() {
    var myLocale = AppLocalizations.of(context);

    return AppBar(
      title: Text(myLocale.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'search',
          onPressed: () {},
        ),
      ],
    );
  }

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

      case 4:
        return MyCatalog();
        break;

      case 5:
        return MyCart();
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
      body: _switch(_currentIndex),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 1')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 2')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('random')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('catalog')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('cart')),
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
            accountEmail: new Text('my email@email.com'),
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
          ListTile(
            leading: new CircleAvatar(
              child: Icon(Icons.color_lens),
            ),
            title: Text('Theme Setting'),
            onTap: () {
              Navigator.pushNamed(context, '/theme');
            },
          ),
        ],
      ),
    );
  }
}
