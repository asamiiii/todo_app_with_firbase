import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_model/task_model.dart';
import '../home_layout/layout_widgets.dart';
import '../network/remote/firebase_oprations.dart';
import '../provider/appProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider=Provider.of<AppProvider>(context);
    return StreamBuilder<QuerySnapshot<TaskModel>>(
      
            stream:getTasksFromFirestore(myProvider.onDateChange)  ,
            builder: (context, snapshot) {
              (snapshot.connectionState==ConnectionState.waiting)?
              Center(child: CircularProgressIndicator()):null;
              (snapshot.hasError)? Center(child: Text('someting went wrong')):null;
              List<TaskModel> tasks =
                snapshot.data?.docs.map((element) => element.data()).toList() ?? [];
                if(tasks.isNotEmpty){
                    return ListView.separated(
            padding: EdgeInsets.only(top: 60,left: 20,right: 20,bottom:80 ),
            itemBuilder: (context, index)=> TaskItem(tasks[index]),
            itemCount:tasks.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20,);
            },
          );
                }
                else{
                  return Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/boy.png',height: 150,width: 150,),
                      Text(AppLocalizations.of(context).noTasksToday,style:Theme.of(context).textTheme.headline3,)
                    ],
                  ));
                }
              
            },
          );
  }
}