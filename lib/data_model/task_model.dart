
class TaskModel  {
  static String collectionName='tasks';
  String? id;
  String? task;
  String? discribtion;
  int? date ;
  bool? isDone;

  TaskModel (
    {
      this.id='',
      required this.task,
      required this.discribtion,
      required this.date ,
      this.isDone=false
    } 
  );

    TaskModel.fromJson(Map<String, Object?> json)
    : this(
        id: json['id']! as String,
        task: json['task']! as String,
        discribtion: json['discribtion']! as String,
        date: json['date']! as int,
        isDone: json['isDone']! as bool
      );

    Map<String, Object?> toJson() {
    return {
      'id': id,
      'task': task,
      'discribtion':discribtion,
      'date':date,
      'isDone':isDone

    };
  

}

}