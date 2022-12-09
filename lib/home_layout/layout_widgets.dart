import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: 0,
            backgroundColor: Colors.transparent,
            enableFeedback: true,
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.list_outlined,size: 30,),label: '',),
              BottomNavigationBarItem(icon:Icon(Icons.settings,size: 30),label: ''),
              ]
            ),
        );
  }
}



class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
            isExtended: true,
            onPressed: (){},
            child: const Icon(Icons.add),
          );
  }
}


class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
          width: MediaQuery.of(context).size.width,
          top: 150,
          child: Card(
            
            color: Colors.transparent,
            elevation: 0,
          child: CalenderPicker(
            height: 90,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
            },
            
          ),
              ),
        );
  }
}



class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
            shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(80),)),
            automaticallyImplyLeading: false, 
            flexibleSpace: Container(),
            title: Container(
              padding: const EdgeInsets.all(10),
              child: const Text('To Do List',maxLines: 1,softWrap: false)),
          );
  }
}