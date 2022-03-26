import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final  Function(double letterValue) onSelectedLetter;
  const LetterDropdownWidget({required this.onSelectedLetter, Key? key})
      : super(key: key);

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
        color: AppConstants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: AppConstants.borderRadius20,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: AppConstants.primaryColor.shade700,
        value: selectedLetterValue,
        onChanged: (value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onSelectedLetter(value);
          });
        },
        underline: Container(),
        items: DataHelper.generateGrade(),
      ),
    );
  }
}
