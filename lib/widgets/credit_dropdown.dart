import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function(double creditValue) onSelectedCredit;
  const CreditDropdownWidget({required this.onSelectedCredit, Key? key})
      : super(key: key);

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
        color: AppConstants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: AppConstants.borderRadius20,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: AppConstants.primaryColor.shade700,
        value: selectedCreditValue,
        onChanged: (value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onSelectedCredit(value);
          });
        },
        underline: Container(),
        items: DataHelper.generateCourseCredit(),
      ),
    );
  }
}
