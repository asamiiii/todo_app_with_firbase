import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme/app_theme.dart';
import '../data_model/task_model.dart';
import '../network/remote/firebase_oprations.dart';

Future showBottomSheetTask(BuildContext context, var myProvider,
    {String? id, TaskModel? task}) {
  TextEditingController? taskTitle;
  TextEditingController? taskDescription;
  final formKey = GlobalKey<FormState>();

  if (task != null) {
    taskTitle = TextEditingController(text: task.task);
    taskDescription = TextEditingController(text: task.discribtion);
  } else {
    taskTitle = TextEditingController();
    taskDescription = TextEditingController();
  }

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.all(20),
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              task == null ? 'Add new task' : 'Update task',
              style: Theme.of(context).textTheme.headline1,
            )),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (taskTitle) {
                        if (taskTitle == null || taskTitle.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                        // return null;
                      },
                      controller: taskTitle,
                      decoration: InputDecoration(
                          hintText: 'title',
                          labelText: 'title',
                          labelStyle:TextStyle(
                            color: myProvider.isDark ?whiteMainColor: blackMainColor
                          ),
                          //labelStyle: 
                          ),
                    ),
                    TextFormField(
                      validator: (taskDescription) {
                        if (taskDescription == null || taskDescription.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                        // return null;
                      },
                      controller: taskDescription,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: 'discription',
                          labelText: 'discription',
                          labelStyle:TextStyle(
                            color:  myProvider.isDark ? whiteMainColor :blackMainColor
                          ),
                          alignLabelWithHint: true),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Time',
              style: Theme.of(context).textTheme.headline1,
            ),
            InkWell(
              child: Center(
                  child: Text(
                '${myProvider.selectedDatee.day}/${myProvider.selectedDatee.month}/${myProvider.selectedDatee.year}',
                style: TextStyle(color: blueMainColor),
              )),
              onTap: () {
                myProvider.selectDate(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showLoading(context, 'Loading ... ');
                    if (id == null) {
                      addTaskToFirebase(
                        TaskModel(
                            task: taskTitle?.text,
                            discribtion: taskDescription?.text,
                            date: DateTime.parse(
                                    myProvider.selectedDatee.toString())
                                .microsecondsSinceEpoch),
                      ).then((value) => hideLoading(context));
                    } else {
                      updateTask(
                              id,
                              TaskModel(
                                  task: taskTitle?.text,
                                  discribtion: taskDescription?.text,
                                  date: DateTime.parse(
                                          myProvider.selectedDatee.toString())
                                      .microsecondsSinceEpoch))
                          .then((value) => hideLoading(context));
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    id == null ? Text('Add Task') : Text('Update Task'),
                    SizedBox(
                      width: 5,
                    ),
                    id == null ? Icon(Icons.add) : Icon(Icons.edit)
                  ],
                ))
          ],
        ),
      );
    },
  );
}