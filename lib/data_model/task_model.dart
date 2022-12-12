class TaskModel {
  static String collectionName='tasks';
  String? id;
  String? task;
  String? discribtion;
  DateTime? date;
  bool? isDone;

  TaskModel(
    {
      this.id,
      this.task,
      this.discribtion,
      this.date,
      this.isDone
    }
  );

  

}