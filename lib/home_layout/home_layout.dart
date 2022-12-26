import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_widgets.dart';
import '../provider/appProvider.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
      var myProvider=Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
        appBar:PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: MainAppBar() ),
          body:screens[myProvider.currentIndex],
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton:FloatingAction() ,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),

        myProvider.currentIndex==0 ? Calender() : SizedBox(),

      ]
      
    );
  }
}