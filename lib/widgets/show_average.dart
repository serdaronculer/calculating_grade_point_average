import 'package:calculating_grade_point_average/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lessonsNumber;
  const ShowAverage(
      {Key? key, required this.average, required this.lessonsNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonsNumber > 0
              ? '$lessonsNumber lessons added'
              : 'choose your lesson',
          style: AppConstants.styles(fontWeight: FontWeight.w600, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Text(
          average > 0 ? '${average.toStringAsFixed(2)}' : '0.00',
          style: AppConstants.styles(fontSize: 55, fontWeight: FontWeight.w800),
        ),
        Text(
          "Average",
          style: AppConstants.styles(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }
}
