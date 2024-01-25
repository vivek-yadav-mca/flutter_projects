import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list_challenge/tasklist.dart';
import 'package:todoey_list_challenge/widgets/list_view.dart';
import 'package:todoey_list_challenge/screens/bottom_sheet.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                bottom: 32.0, top: 64.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40.0,
                  child: Icon(
                    Icons.list_rounded,
                    size: 50.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(color: Colors.white, fontSize: 50.0),
                ),
                Text(
                  Provider.of<TaskList>(context, listen: true)
                          .taskList
                          .length
                          .toString() +
                      ' ' +
                      'Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                  color: Colors.white),
              child: ListViewWid(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ModalBottomSheet(context: context).MdlBtmSht();
            },
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
