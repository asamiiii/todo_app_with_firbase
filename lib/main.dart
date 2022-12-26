import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_firbase/local/cashe_helper.dart';
import 'package:todo_app_with_firbase/provider/appProvider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/home_layout/home_layout.dart';
import 'app_theme/app_theme.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CasheHelper.init();
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
    ],
    child: MyApp(),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''), // English , no country code
              Locale('ar', ''), // Arabic  , no country code
            ],
            locale:  Locale(value.isArabic! ? value.arLanguage:value.enLanguage),
            theme: value.isDark! ? darkMode : lightMode,
            home: HomeLayout(),
          );
        }));
  }
}
