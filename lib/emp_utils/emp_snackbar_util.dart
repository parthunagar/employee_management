import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:flutter/material.dart';

class EmpSnackbarUtil {
  static showSnackBar(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 2),
    ));
  }

  static showSnackBarWithAction(context, msg, {void Function()? onTap}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              msg,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: EmpColors.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'Undo',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: EmpColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
