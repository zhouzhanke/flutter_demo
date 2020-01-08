import 'package:flutter/material.dart';
import 'package:flutter_app3/common/Global.dart';
import 'package:flutter_app3/models/ProfileChangeNotifier.dart';
import 'package:flutter_app3/screens/Navigation.dart';
import 'package:flutter_app3/screens/language_setting_page.dart';
import 'package:flutter_app3/screens/page1.dart';
import 'package:flutter_app3/screens/page2.dart';
import 'package:flutter_app3/screens/theme_setting.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/localization_intl.dart';

import 'package:provider/provider.dart';
import 'package:flutter_app3/models/cart.dart';
import 'package:flutter_app3/models/catalog.dart';
import 'package:flutter_app3/screens/cart.dart';
import 'package:flutter_app3/screens/catalog.dart';

// app entrance
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel.empty(),
          update: (context, catalog, previousCart) =>
              CartModel(catalog, previousCart),
        ),

        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            title: 'Flutter Demo',
//      debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: themeModel.theme,
//                canvasColor: Colors.white,
//                primaryColor: Colors.black,
//                brightness: Brightness.light,
              textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
//                  color: Colors.black,
                ),
              ),
            ),

            locale: localeModel.getLocale(),

            // supported language
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('zh', 'CN'),
            ],
            // localizations delegate
            localizationsDelegates: [
              // built-in localization for basic text for material widgets
              GlobalMaterialLocalizations.delegate,
              // built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // built-in localization for basic text for IOS widgets
              GlobalCupertinoLocalizations.delegate,

              AppLocalizationsDelegate(),
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                Locale locale;
                //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
                //则默认使用美国英语
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  locale = Locale('en', 'US');
                }
                return locale;
              }
            },

            // initial route page
            initialRoute: 'pageHome',
            routes: {
              'pageHome': (context) => MyHomePage(),
              '/page1': (context) => FirstPage(),
              '/page2': (context) => SecondPage(),
              '/language': (context) => LanguagePage(),
              '/': (context) => MyCatalog(),
              '/cart': (context) => MyCart(),
              '/theme': (context) => ThemeChangeRoute(),
            },
          );
        },
      ),
    );
  }
}
