import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'widgets/calculate_average_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculating Grade Point Average',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppConstants.primaryColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CalculateAveragePage());
  }
}
