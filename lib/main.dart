import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff5D9CEC),
          //toolbarHeight: 157,
          elevation: 0
        ),
        scaffoldBackgroundColor: const Color(0xFFDFECDB)
      ),
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(157),
          child: AppBar(
            shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50),)),
            automaticallyImplyLeading: false, 
            flexibleSpace: Container(),
            title: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('To Do List',maxLines: 1,softWrap: false)),
          ),
          
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            enableFeedback: true,
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Image.asset('assets/images/icon_list.png'),label: ''),
              BottomNavigationBarItem(icon: Image.asset('assets/images/icon_settings.png'),label: ''),
              ]
            ),
        ),
          floatingActionButton: FloatingActionButton(
            isExtended: true,
            onPressed: (){},
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
      

      ]
      
    );
  }
}