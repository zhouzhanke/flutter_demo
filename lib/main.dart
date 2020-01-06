import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/Navigation.dart';
import 'package:flutter_app3/pages/language_setting_page.dart';
import 'package:flutter_app3/pages/page1.dart';
import 'package:flutter_app3/pages/page2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/localization_intl.dart';

// app entrance
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.white,
          primaryColor: Colors.black,
          brightness: Brightness.light,
          textTheme: TextTheme(
              body1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ))),

      // localizations
      localizationsDelegates: [
        // built-in localization for basic text for material widgets
        GlobalMaterialLocalizations.delegate,
        // built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        // built-in localization for basic text for IOS widgets
        GlobalCupertinoLocalizations.delegate,

        AppLocalizationsDelegate(),
      ],

      // supported language
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'CN'),
      ],
      home: MyHomePage(),

      routes: {
        'pageHome': (context) => MyHomePage(),
        '/page1': (context) => FirstPage(),
        '/page2': (context) => SecondPage(),
        '/language': (context) => LanguagePage(),
      },
      // initial route page
      initialRoute: 'pageHome',
    );
  }
}
