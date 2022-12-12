import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';



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
            onPressed: (){
              showModalBottomSheet(
                context: context,
                 builder: (context) {
                   return Container(
                    padding: EdgeInsets.all(20),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Center(child: Text('Add new task',style: Theme.of(context).textTheme.headline6,)),
                         Form(
                           child:Column(
                             children: [
                               TextFormField(
                                validator: (value) {
                                  if(value!.isEmpty){
                                     return 'title must be not empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'title',
                                  labelText: 'title'
                                ),
                                
                               ),
                               TextFormField(
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText: 'discription',
                                  labelText: 'discription',
                                  alignLabelWithHint: true
                                ),
                               ),
                              
                             ],
                           ) )
                         ,
                         SizedBox(height: 20,),
                         Text('Select Time',style: Theme.of(context).textTheme.headline6,),
                         Center(child: Text('12/12/2022',style:TextStyle(color:blueMainColor),)),
                         SizedBox(height: 20,),
                         ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add Task'),
                            Icon(Icons.add)
                          ],
                          ))
                       ],
                     ),
                   );
                 },);
            },
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
          top: 120,
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
              print(date);
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

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(

      key: Key('d'),
      background:Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.90,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Icon(Icons.delete,size: 50,color: whiteMainColor,),
                   Text('delete')
                  ],
                ),
              ) ,
      child: Container(
                width: MediaQuery.of(context).size.width*0.90,
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
                    Expanded(
                      child: Column(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
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
              ),
    );
  }
}