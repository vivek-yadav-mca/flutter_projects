class TaskList {
  late String taskText;
  TaskList({required this.taskText});
}

void main() {
  TaskList taskList = TaskList(taskText: 'hello');
  TaskList taskList1 = TaskList(taskText: 'hi');

  taskList.taskText = 'fghj';

  print(taskList.taskText);
  print(taskList1.taskText);
}
