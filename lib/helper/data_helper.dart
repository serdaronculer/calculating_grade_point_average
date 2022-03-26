import 'package:flutter/material.dart';

import '../model/lesson.dart';

class DataHelper {
  static List<String> _lessonLetters() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _letterToNumber(String letter) {
    switch (letter) {
      case "AA":
        return 4;

      case "BA":
        return 3.5;

      case "BB":
        return 3.0;

      case "CB":
        return 2.5;

      case "CC":
        return 2;

      case "DC":
        return 1.5;

      case "DD":
        return 1;

      case "FD":
        return 0.5;

      case "FF":
        return 0.0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> generateGrade() {
    return _lessonLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _letterToNumber(e),
            ))
        .toList();
  }

  static List<int> _courseCredit() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> generateCourseCredit() {
    return _courseCredit()
        .map((e) => DropdownMenuItem(
              child: Text("$e"),
              value: e.toDouble(),
            ))
        .toList();
  }

  static final List<Lesson> lessons = [];

  static addLesson(Lesson lesson) {
    lessons.add(lesson);
  }

  static double calculateAverage() {
    double totalCredit = 0;
    double totalGrade = 0;

    for (Lesson element in lessons) {
      totalGrade = totalGrade + (element.creditValue * element.letterValue);
      totalCredit += element.creditValue;
    }
    return totalGrade / totalCredit;
  }
}
