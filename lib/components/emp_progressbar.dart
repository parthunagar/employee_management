import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmpProgressbar extends StatelessWidget {
  Color? color;
  EmpProgressbar({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? EmpColors.primary,
      ),
    );
  }
}
