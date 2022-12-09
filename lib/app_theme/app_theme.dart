import 'package:flutter/material.dart';

 Color blueMainColor = const Color(0xff5D9CEC);
 Color whiteMainColor =  Colors.white;


ThemeData themeData=ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme:  AppBarTheme(
          backgroundColor: blueMainColor,
          //toolbarHeight: 157,
          elevation: 0
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //selectedItemColor: ,
          selectedIconTheme: IconThemeData(
            color: blueMainColor,
          ),
          unselectedIconTheme: IconThemeData(
            size: 10
          ),
          u
          
          
        ),
        scaffoldBackgroundColor: const Color(0xFFDFECDB),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize:20,color:blueMainColor,fontWeight: FontWeight.bold)
        )
      );