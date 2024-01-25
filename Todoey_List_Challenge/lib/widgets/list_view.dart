import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list_challenge/tasklist.dart';

class ListViewWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(builder: (context, taskList, child) {
      return ListView.builder(
          itemCount: taskList.taskList.length,
          itemBuilder: (context, index) {
            if (taskList.taskList[index].taskName != '')
              return Dismissible(
                key: Key(taskList.taskList[index].taskName),
                onDismissed: (direction) {
                  // if (direction == DismissDirection.endToStart) {
                  taskList.removeData(index);
                  // }
                },
                background: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    )
                  ],
                ),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text(
                      taskList.taskList[index].taskName.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          decoration: taskList.taskList[index].checkBoxState
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    trailing: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.lightBlueAccent,
                      value: taskList.taskList[index].checkBoxState,
                      onChanged: (value) {
                        taskList.updateCheckBoxState(index);
                      },
                    ),
                  ),
                ),
              );
            else {}
          });
    });
  }
}

// for (int i=0;i<Provider.of<TaskList>(context, listen: true).taskList.length;)
// ListTileWid(listTileText: text),
