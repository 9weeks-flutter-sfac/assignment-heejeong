class Todo{
  String title;
  bool completed;
  int id;
  int userId;

  Todo({
    required this.title, required this.completed, required this.id, required this.userId
  });

  factory Todo.fromMap(Map<String, dynamic> map){
    return Todo(
      title: map['title'],
      completed: map['completed'],
      id: map['id'],
      userId: map['userId']
    );
  }
}