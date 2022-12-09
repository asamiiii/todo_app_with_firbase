import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/home_layout/layout_widgets.dart';
import 'app_theme/app_theme.dart';
import 'package:calender_picker/calender_picker.dart';

void main() {
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
            padding: EdgeInsets.only(top: 80,left: 20,right: 20),
            itemBuilder: (context, index) {
              return Container(
              width: MediaQuery.of(context).size.width*0.70,
              height: 100,
              decoration: BoxDecoration(
                color: whiteMainColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 5,
                    height: MediaQuery.of(context).size.height*50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: blueMainColor,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Play basket ball',style:Theme.of(context).textTheme.headline1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.alarm_on_sharp),
                          Text('10:00 AM')
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                  width: 70,
                  height: MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    color: blueMainColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.check,size: 30,color: whiteMainColor,),
                    )
                ],
              ),
            );
            },
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