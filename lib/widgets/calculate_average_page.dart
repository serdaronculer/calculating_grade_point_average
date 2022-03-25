import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'show_average.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            AppConstants.title,
            style: AppConstants.headlineStyle,
          ),
        ),
        elevation: 0, //! Default [Elevation] 4.0
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  child: ShowAverage(average: 2, lessonsNumber: 5),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppConstants.primaryColor,
              child: Text(
                "the list will be here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
            ],
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Math",
        border: OutlineInputBorder(
          borderRadius: AppConstants.borderRadius20,
        ),
        fillColor: AppConstants.primaryColor.shade100.withOpacity(.3),
        filled: true,
      ),
    );
  }
}

///  The [BuildOwner] for this context.
