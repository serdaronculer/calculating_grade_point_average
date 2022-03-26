import 'package:calculating_grade_point_average/widgets/credit_dropdown.dart';
import 'package:calculating_grade_point_average/widgets/letter_dropdown.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../helper/data_helper.dart';
import '../model/lesson.dart';
import 'lesson_list.dart';
import 'show_average.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String selectedCourseName = "";
  TextEditingController lessonTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  child: ShowAverage(
                      average: DataHelper.calculateAverage(),
                      lessonsNumber: DataHelper.lessons.length),
                ),
              ],
            ),
          ),
          Expanded(
            child: LessonList(
              onDismiss: (index) {
                setState(() {
                  DataHelper.lessons.removeAt(index);
                });
              },
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LetterDropdownWidget(
                  onSelectedLetter: (letterValue) {
                    selectedLetterValue = letterValue;
                  },
                ),
                CreditDropdownWidget(
                  onSelectedCredit: (double creditValue) {
                    selectedCreditValue = creditValue;
                  },
                ),
                IconButton(
                  onPressed: () {
                    _addLesson();
                    lessonTextFieldController.clear();
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: AppConstants.primaryColor,
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      controller: lessonTextFieldController,
      onSaved: (newValue) => setState(() {
        selectedCourseName = newValue!;
      }),
      validator: (value) {
        if (value!.length <= 0) {
          return 'Please fill in the course name';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Math",
        border: OutlineInputBorder(
          borderRadius: AppConstants.borderRadius20,
          borderSide: BorderSide.none,
        ),
        fillColor: AppConstants.primaryColor.shade100.withOpacity(.3),
        filled: true,
      ),
    );
  }

  void _addLesson() {
    bool dataControl = formKey.currentState!.validate();

    if (dataControl) {
      formKey.currentState!.save();
      Lesson lesson = Lesson(
          courseName: selectedCourseName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addLesson(lesson);
      setState(() {});
    }
  }
}
