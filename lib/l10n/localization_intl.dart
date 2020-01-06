import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('demo',
        name: 'title', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'messages_all.dart'; //1
//
//class DemoLocalizations {
//  DemoLocalizations(this.localeName);
//
//  static Future<DemoLocalizations> load(Locale locale) {
//    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
//    final String localeName = Intl.canonicalizedLocale(name);
//    return initializeMessages(localeName).then((_) {
//      return DemoLocalizations(localeName);
//    });
//  }
//
//  static DemoLocalizations of(BuildContext context) {
//    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
//  }
//
//  final String localeName;
//
//  String get title {
//    return Intl.message(
//      'flutter demo',
//      name: 'title',
//      desc: 'Title for the Demo application',
//      locale: localeName,
//    );
//  }
//}
////Locale代理类
//class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
//  const DemoLocalizationsDelegate();
//
//  //是否支持某个Local
//  @override
//  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);
//
//  // Flutter会调用此类加载相应的Locale资源类
//  @override
//  Future<DemoLocalizations> load(Locale locale) {
//    print('current locale: $locale');
//    //3
//    return  DemoLocalizations.load(locale);
//  }
//
//  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
//  @override
//  bool shouldReload(DemoLocalizationsDelegate old) => false;
//}