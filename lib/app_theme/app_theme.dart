import 'package:flutter/material.dart';

 Color blueMainColor = const Color(0xff5D9CEC);
 Color whiteMainColor =  Colors.white;
 Color GreenDoneColor = Colors.green;


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
          headline1: TextStyle(fontSize:20,color:blueMainColor,fontWeight: FontWeight.bold)
        ),


      );