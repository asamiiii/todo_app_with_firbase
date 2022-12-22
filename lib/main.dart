import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_firbase/data_model/task_model.dart';
import 'package:todo_app_with_firbase/network/remote/firebase_oprations.dart';
import 'package:todo_app_with_firbase/provider/appProvider.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/home_layout/layout_widgets.dart';
import 'package:todo_app_with_firbase/home_layout/home_layout.dart';
import 'app_theme/app_theme.dart';
import 'firebase_options.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  
  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    );

    runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child:Consumer<AppProvider> (
        builder: (context, value, child) => 
    MaterialApp(
      theme: themeData,
      home: HomeLayout(),
    )));
  }
}

