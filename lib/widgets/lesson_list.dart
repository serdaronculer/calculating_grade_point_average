import 'package:calculating_grade_point_average/constants/app_constants.dart';
import 'package:calculating_grade_point_average/model/lesson.dart';
import 'package:calculating_grade_point_average/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '../helper/data_helper.dart';

class LessonList extends StatelessWidget {
  final Function(int index) onDismiss;
  const LessonList({Key? key, required this.onDismiss}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Lesson> lessons = DataHelper.lessons;

    return lessons.length > 0
        ? ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red.shade400,
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        TrashIcon.trash_alt,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(lessons[index].courseName),
                      leading: CircleAvatar(
                        backgroundColor: AppConstants.primaryColor,
                        child: Text((lessons[index].letterValue *
                                lessons[index].creditValue)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "${lessons[index].creditValue.toStringAsFixed(0)} Credit, Letter Grade ${lessons[index].letterValue}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Please add lesson",
              style: AppConstants.headlineStyle,
            )),
          );
  }
}
