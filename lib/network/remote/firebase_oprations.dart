import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_with_firbase/data_model/task_model.dart';

final taskRef = FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
      toFirestore: (task, _) => task.toJson(),
    );


CollectionReference getTaskCollection(){
  return FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
      toFirestore: (task, _) => task.toJson(),);
}

    Future<void> addTaskToFirebase(TaskModel task)async{
     var collection = getTaskCollection();
     var docRef=collection.doc();
     task.id=docRef.id;
     return await docRef.set(task);
    }

//final Stream<QuerySnapshot> taskStream = FirebaseFirestore.instance.collection('users').snapshots();

Stream<QuerySnapshot<TaskModel>>? getTasksFromFirestore(DateTime dateTime) {
  return getTaskCollection().where(
    'date',
     isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots() as Stream<QuerySnapshot<TaskModel>>? ; 

}


Future<void> deleteUser(String taskId) {
  var collection = getTaskCollection();
  var docRef=collection.doc(taskId);
  
  return docRef.delete().
  then((value) => print("User Deleted")).
  catchError((error) => print("Failed to delete user: $error"));
  
}

Future<void> updateTask(String taskId,TaskModel task) {
  var collection = getTaskCollection();
  var docRef=collection.doc(taskId);
  return docRef.update({
    'date':task.date,
    'task':task.task,
    'discribtion':task.discribtion
  });
    }


Future<void> updateTaskStatus(String taskId,bool isDone) {
  var collection = getTaskCollection();
  var docRef=collection.doc(taskId);
  return docRef.update({
    'isDone':isDone,
  });
    }


void showLoading(BuildContext context, String message,
    {bool isCancellable = true}) {
  showDialog(
    context: context,
    barrierDismissible: isCancellable,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Text(message),
            SizedBox(
              width: 15,
            ),
            CircularProgressIndicator()
          ],
        ),
      );
    },
  );
  
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
  Navigator.pop(context);
  
  
}
