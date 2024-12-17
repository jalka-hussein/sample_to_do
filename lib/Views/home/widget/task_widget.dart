import 'package:flutter/material.dart';
import 'package:to_do_list/Utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //navigate to task view to see task details
      },
      child: AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Appcolors.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 4),
                    blurRadius: 10)
              ]),
          duration: Duration(milliseconds: 600),
          child: ListTile(
            //chech icon
            leading: GestureDetector(
              onTap: () {
                //check or uncheck the task
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 600),
                decoration: BoxDecoration(
                    color: Appcolors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: .8)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            //task title
            title: const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 3),
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  //decoration: TextDecoration.lineThrough
                ),
              ),
            ),

            // task subtitle
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Describtion",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
                ),

                //date of task
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "SubDate",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
