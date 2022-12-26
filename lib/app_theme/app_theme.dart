import 'package:flutter/material.dart';

 Color blueMainColor = const Color(0xff5D9CEC);
 Color whiteMainColor =  Colors.white;
 Color GreenDoneColor = Colors.green;
 Color blackMainColor = Colors.black;


ThemeData lightMode=ThemeData(
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
        ),
        scaffoldBackgroundColor: const Color(0xFFDFECDB),
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          )
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize:20,color:blueMainColor,fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize:17,color:blackMainColor,),
          headline3: TextStyle(fontSize:15,color:blackMainColor,)
        ),


      );

      ThemeData darkMode=ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme:  AppBarTheme(
          backgroundColor: blueMainColor,
          //toolbarHeight: 157,
          elevation: 0
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF060E1E),
          selectedIconTheme: IconThemeData(
            color: blueMainColor,
          ),
          unselectedIconTheme: IconThemeData(
            size: 10
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF060E1E),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: const Color(0xFF141922),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          )
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize:20,color:blueMainColor,fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize:15,color:whiteMainColor,),
          headline3: TextStyle(fontSize:15,color:whiteMainColor,)

        ),
        
        );