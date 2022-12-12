import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/home_layout/layout_widgets.dart';
import 'app_theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
        appBar:PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: MainAppBar() ),
          body: ListView.separated(
            padding: EdgeInsets.only(top: 60,left: 20,right: 20,bottom:80 ),
            itemBuilder: (context, index)=>TaskItem(),
            itemCount:5,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20,);
            },
            
          ),
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton:FloatingAction() ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),

        Calender(),

      ]
      
    );
  }
}