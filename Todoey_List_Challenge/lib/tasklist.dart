import 'package:flutter/cupertino.dart';
import 'package:todoey_list_challenge/model/modal_class.dart';

class TaskList extends ChangeNotifier {
  late String taskName;
  bool checkBoxState;
  List<ModalClass> taskList = [];
  TaskList({required this.taskName, this.checkBoxState = false});
  void updateTaskList(String newTask) {
    taskName = newTask;
    taskList.add(ModalClass(taskName: taskName, checkBoxState: checkBoxState));
    print(taskList);
    notifyListeners();
  }

  void updateCheckBoxState(int idx) {
    taskList[idx].checkBoxState = !taskList[idx].checkBoxState;
    notifyListeners();
  }

  void removeData(int idx) {
    taskList.removeAt(idx);
    notifyListeners();
  }
}
