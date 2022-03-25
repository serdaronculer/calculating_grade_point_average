import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  /// Default [Elevation] 4.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(child: Text(AppConstants.title)),
        elevation: 0,
      ),
      body: Center(
          child: Text(
        "Merhabalar",
        style: AppConstants.headlineStyle,
      )),
    );
  }
}

///  The [BuildOwner] for this context.
