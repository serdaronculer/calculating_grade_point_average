class Lesson {
  late String courseName;
  late double letterValue;
  late double creditValue;

  Lesson(
      {required this.courseName,
      required this.letterValue,
      required this.creditValue});

  @override
  String toString() {
    return (courseName +
        " " +
        letterValue.toString() +
        " " +
        creditValue.toString());
  }
}
