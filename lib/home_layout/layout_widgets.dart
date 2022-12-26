import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_firbase/data_model/task_model.dart';
import 'package:todo_app_with_firbase/network/remote/firebase_oprations.dart';
import 'package:todo_app_with_firbase/provider/appProvider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_with_firbase/screens/settings_screen/settings_screen.dart';
import '../app_theme/app_theme.dart';
import '../screens/tasks_screen.dart';
import 'bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Widget> screens = [TasksScreen(),SettingsScreen()];



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<AppProvider>(context);
    return BottomAppBar(

          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            onTap: (index){
               myProvider.toggleNavBar(index);
            },
            currentIndex: 0,
            backgroundColor: myProvider.isDark! ? Color(0xFF141922):Colors.transparent ,
            enableFeedback: true,
            elevation: 0,
            
            items: [
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.list_outlined,
                  size: 30,
                  color:myProvider.currentIndex==0?blueMainColor:Colors.grey,
                  ),label: '',),
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.settings,
                  size: 30,
                  color:myProvider.currentIndex==0?Colors.grey : blueMainColor,
                  ),label: ''),
              ]
            ),
        );
  }
}



class FloatingAction extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var myProvider=Provider.of<AppProvider>(context);
    return FloatingActionButton(
            isExtended: true,
            onPressed: (){
              showBottomSheetTask(context,myProvider);
            },
            child: const Icon(Icons.add),
          );
  }
}

class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider=Provider.of<AppProvider>(context);
    return Positioned(
          width: MediaQuery.of(context).size.width,
          top: 120,
          child: Card(
            
            color: Colors.transparent,
            elevation: 0,
            borderOnForeground: true,
          child: CalenderPicker(
            height: 90,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              
              myProvider.getTaskByDate(date);
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
    var myProvider=Provider.of<AppProvider>(context);
    return AppBar(
      
            shape: const RoundedRectangleBorder(
              
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(80),)),
            automaticallyImplyLeading: false, 
            flexibleSpace: Container(),
            title: Container(
              padding: const EdgeInsets.all(10),
              child:Text(
                myProvider.currentIndex==0 ? AppLocalizations.of(context).toDoList: AppLocalizations.of(context).settings,
                maxLines: 1,softWrap: false
                )),
          );
  }
}

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {

 TaskModel task ;

 TaskItem(this.task) ;

  @override
  Widget build(BuildContext context) {
    var myProvider=Provider.of<AppProvider>(context);
    return Slidable(
      key: Key('d'),
      startActionPane: ActionPane(
    motion: const ScrollMotion(),
    children:  [
      SlidableAction(
        onPressed: (context) => deleteUser(task.id!),
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon:Icons.delete,
        label: AppLocalizations.of(context).delete,
        borderRadius:BorderRadius.circular(20),
        autoClose: true,

      ),
      SlidableAction(
        onPressed: (context) => showBottomSheetTask(context,myProvider,id:task.id,task:task),
        backgroundColor: blueMainColor,
        foregroundColor: Colors.white,
        icon:Icons.edit,
        label: AppLocalizations.of(context).edite,
        borderRadius:BorderRadius.circular(20),
        autoClose: true,

      ),
     
    ],
  ),
  child:Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: 100,
                decoration: BoxDecoration(
                  color: myProvider.isDark! ? Color(0xFF141922): whiteMainColor,
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
                        color: task.isDone==false ? blueMainColor:GreenDoneColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.task ?? '',
                            style:
                            task.isDone==false ?
                             Theme.of(context).textTheme.headline1:
                             Theme.of(context).textTheme.headline1?.copyWith(color:GreenDoneColor),
                             overflow:TextOverflow.ellipsis,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.alarm_on_sharp,color:myProvider.isDark! ? whiteMainColor:Colors.black,),
                              SizedBox(width: 5,),
                              Expanded(child: Text(task.discribtion ?? '',overflow: TextOverflow.ellipsis,style:Theme.of(context).textTheme.headline3,))
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(task.isDone==false){
                          updateTaskStatus(task.id!,true);
                        }
                        else{
                          updateTaskStatus(task.id!,false);
                        }
                        updateTask(task.id!,task);
                      },
                      // is Done button , if user click it , the button is changing to Done text 
                      child: task.isDone==false ? Container(                   
                        margin: EdgeInsets.only(right: 10),
                      width: 70,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                        color: blueMainColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.check,size: 30,color: whiteMainColor,),
                        ) : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(AppLocalizations.of(context).done,style:TextStyle(color:GreenDoneColor,fontWeight:FontWeight.bold),),
                        ),
                    )
                  ],
                ),
              ),
    );
  }
}