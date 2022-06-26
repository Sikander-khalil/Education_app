import 'package:edu_flex/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/task.dart';


class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,

      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _getBGClr(task?.color??0),
        ),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Container(
                    margin: EdgeInsets.only(right: 150,top: 40),
                    child: Icon(
                      Icons.notification_add_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    print("Hi there");

                  },
                ),
                   Container(
                     margin: EdgeInsets.only(left: 70),
                     child: Text(task?.title??"", style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                   ),

                SizedBox(height: 12,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 60,),

                    ),
                    SizedBox(width: 4,),
                    Container(
margin: EdgeInsets.only(bottom: 2,),
                      child: Text(
                        task?.note??"",
                        style: TextStyle(
                          fontSize: 20, color: Colors.grey[100],
                        ),

                      ),

                      /*Text("${task!.startTime} - ${task!.endTime}",
                      style: TextStyle(
                        fontSize: 13, color: Colors.grey[100],
                      ),
                      ),*/
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
    IconButton(
    icon: Icon(
    Icons.access_time_sharp,
    size: 20,
    color: Colors.black,
    ),
    onPressed: () {

    },
    ),
                    Text("${task.startTime} - ${task.endTime}",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                  //margin: EdgeInsets.only(left: 60),

                ),
                SizedBox(height: 12,),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(task?.repeat??"",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))
              ],
            ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 200,
                width: 9,
              color: Colors.grey
            ),
            RotatedBox(quarterTurns: 3,
            child: Text(
              task.isCompleted==1 ? "Completed" : "Schedule",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),

            ),
            )
          ],
        ),
      ),
    );
  }
  _getBGClr(int no){
    switch(no) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return bluishClr;
    }
  }
}
