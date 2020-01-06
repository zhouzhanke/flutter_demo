//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_app3/pages/RandomPage.dart';
//import 'package:flutter_app3/pages/page1.dart';
//import 'package:flutter_app3/pages/page2.dart';
//
//import 'dart:math';
//import 'package:flutter_app3/l10n/localization_intl.dart';
//
///// home page
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key}) : super(key: key);
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//  double sideLength = 100;
//  int _currentIndex = 0;
//
//  // increment counter function
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//    print('counter increment by 1! it is $_counter now!');
//  }
//
//  // reset counter function
//  void _resetCounter() {
//    setState(() {
//      _counter = 0;
//    });
//    print('counter reset!');
//  }
//
//  Widget _buildAppBar() {
//    return AppBar(
//      title: Text(AppLocalizations.of(context).title),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.search),
//          tooltip: 'search',
//          onPressed: () {},
//        ),
//      ],
//    );
//  }
//
//  Widget _buildBody() {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            width: double.infinity,
//            decoration: BoxDecoration(
//              border: new Border.all(
//                width: 5,
//              ),
//              borderRadius: BorderRadius.all(Radius.circular(8.0)),
//            ),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Opacity(
//                  opacity: 0.5,
//                  child: Text(
//                    'opacity demo',
//                    style: TextStyle(
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                ),
//                Text(
//                  ' You have pushed the button this many times: '
//                      '\n$_counter',
//                  style: Theme.of(context).textTheme.display1,
//                  textAlign: TextAlign.center,
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: RaisedButton(
//                        onPressed: _incrementCounter,
//                        child: Text('+1'),
//                      ),
//                    ),
//                    // reset counter test button
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: RaisedButton(
//                        onPressed: _resetCounter,
//                        child: Text('Reset'),
//                      ),
//                    ),
//
//                    // reset counter test icon
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: IconButton(
//                        icon: Icon(Icons.all_inclusive),
//                        tooltip: 'icon',
//                        onPressed: () {
//                          setState(() {
//                            _counter = Random().nextInt(100 + 1);
//                          });
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ),
//
//          // switch page
//          RaisedButton(
//            onPressed: () => Navigator.pushNamed(context, '/page1'),
//            child: Text('switch page demo'),
//          ),
//
//          SizedBox(
//            height: 10,
//          ),
//
//          // inkwell sample
//          AnimatedContainer(
//            height: sideLength,
//            width: sideLength,
//            duration: Duration(seconds: 2),
//            curve: Curves.easeIn,
//            child: Material(
//              color: Colors.deepOrange,
//              child: InkWell(
//                child: Center(
//                  child: Text(
//                    'Tap me',
//                  ),
//                ),
//                onTap: () {
//                  setState(() {
//                    sideLength == 100 ? sideLength = 200 : sideLength = 100;
//                  });
//                },
//              ),
//            ),
//          ),
//          CupertinoButton(
//            child: Text('IOS button'),
//            pressedOpacity: .5,
//            color: Colors.grey,
////            padding: const EdgeInsets.all(10), // shrink to text size
//            onPressed: () {},
//          ),
////          CupertinoActivityIndicator(
////            radius: 30,
////            animating: true,
////          )
//        ],
//      ),
//    );
//  }
//
//  Widget _buildFloatingButton() {
//    return FloatingActionButton(
//      onPressed: _incrementCounter,
//      tooltip: 'Increment',
//      backgroundColor: Colors.black,
//      child: Icon(Icons.add),
//    ); // This trailing comma makes auto-formatting nicer for build methods.
//  }
//
//  Widget _switch(index) {
//    switch (index) {
//      case 0:
//        return _buildBody();
//        break;
//
//      case 1:
//        return FirstPage();
//        break;
//
//      case 2:
//        return SecondPage();
//        break;
//
//      case 3:
//        return RandomPage();
//        break;
//
//      default:
//        return null;
//        break;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: _buildAppBar(),
////      body: _buildBody(),
//      body: _switch(_currentIndex),
//      drawer: MyDrawer(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 1')),
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('page 2')),
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('random')),
//        ],
//        currentIndex: _currentIndex,
//        selectedItemColor: Colors.red,
//        unselectedItemColor: Colors.blue,
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//      ),
////      floatingActionButton: _buildFloatingButton(),
//      // This trailing comma makes auto-formatting nicer for build methods.
//      // centralize
////      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//    );
//  }
//}
//
//class MyDrawer extends StatelessWidget {
////  const MyDrawer({
////    Key key,
////  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Drawer(
//      child: ListView(
//        children: <Widget>[
//          UserAccountsDrawerHeader(
//            currentAccountPicture: new CircleAvatar(
//              child: FlutterLogo(),
//            ),
//            accountName: new Text('my name'),
//            accountEmail: new Text('my email@xxxxx.com'),
//            otherAccountsPictures: <Widget>[
//              new Container(
//                child: FlutterLogo(),
//              )
//            ],
//            onDetailsPressed: () {},
//          ),
//          ListTile(
//            leading: new CircleAvatar(
//              child: Icon(Icons.language),
//            ),
//            title: Text('Language Setting'),
//            onTap: () {
//              Navigator.pushNamed(context, '/language');
//            },
//          ),
//        ],
//      ),
//    );
//  }
//
////  Widget _buildMenus() {
////    return ListView(
////      children: <Widget>[
////        ListTile(
////          title: Text('language setting'),
//////          onTap: () => Navigator.pushNamed(context, '/language'),
////        )
////      ],
////    );
////  }
//}
