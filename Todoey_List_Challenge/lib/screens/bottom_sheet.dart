import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list_challenge/tasklist.dart';

late String taskName;

class ModalBottomSheet {
  BuildContext context;

  ModalBottomSheet({required this.context});

  Widget MdlBtmSht() {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 32.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add a Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size) * 0.80).width,
              child: TextField(
                // decoration: InputDecoration(
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.blueAccent, width: 0.0),
                //   ),
                // ),
                onChanged: (newValue) {
                  taskName = newValue;
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                Provider.of<TaskList>(context, listen: false)
                    .updateTaskList(taskName);
                taskName = '';
                if (taskName != null)
                  Navigator.of(context).pop();
                else {}
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
