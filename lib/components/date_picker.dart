import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:employee_management/emp_utils/emp_datetime_convert.dart';
import 'package:employee_management/emp_utils/emp_icon_utils.dart';
import 'package:employee_management/components/emp_text_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePickerWidget extends StatelessWidget {
  // Function(DateTime) onTapToday, onTapNextMonday, onTapNextTuesday, onTap1Week;
  // DateTime selectedDate;
  // void Function(DateTime) onDateChanged;
  // void Function()? onTapCancel, onTapSave;
  bool isStartDate;
  int startDate, endDate;

  DatePickerWidget({
    super.key,
    // required this.onTapToday,
    // required this.onTapNextMonday,
    // required this.onTapNextTuesday,
    // required this.onTap1Week,
    // required this.selectedDate,
    // required this.onDateChanged,
    // required this.onTapCancel,
    // required this.onTapSave,
    required this.isStartDate,
    required this.startDate,
    required this.endDate,
  });
  DateTime selectedDate = DateTime.now();
  bool onTapButton = false;
  @override
  Widget build(BuildContext context) {
    DateTime tempSelectedDate = selectedDate;
    var w = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (context, st) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _quickSelectButton("Today", DateTime.now(), onTapNextMonday),
                        // SizedBox(width: 10),
                        // _quickSelectButton("Next Monday",_getNextWeekday(DateTime.monday), onTapNextMonday),
                        _quickSelectButton("Today", DateTime.now(), (date) {
                          st(() => tempSelectedDate = date);
                          st(() {
                            onTapButton = true;
                          });
                        }),
                        SizedBox(width: 10),
                        _quickSelectButton(
                          "Next Monday",
                          _getNextWeekday(DateTime.monday),
                          (date) {
                            st(() => tempSelectedDate = date);
                            st(() {
                              onTapButton = true;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _quickSelectButton("Next Tuesday",_getNextWeekday(DateTime.tuesday), onTapNextTuesday),
                        // SizedBox(width: 10),
                        // _quickSelectButton("After 1 week",tempSelectedDate.add(Duration(days: 7)), onTap1Week),
                        _quickSelectButton(
                            "Next Tuesday", _getNextWeekday(DateTime.tuesday),
                            (date) {
                          st(() => tempSelectedDate = date);
                          st(() {
                            onTapButton = true;
                          });
                        }),
                        SizedBox(width: 10),
                        // _quickSelectButton("After 1 week", tempSelectedDate.add(Duration(days: 7)), (date) {
                        _quickSelectButton("After 1 week", DateTime.now().add(Duration(days: 7)), (date) {
                          st(() => tempSelectedDate = date);
                          st(() {
                            onTapButton = true;
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              // Date Picker
              SizedBox(
                height: 250,
                width: w,
                child: CalendarDatePicker(
                  // initialDate: isStartDate
                  //     ? DateTime.fromMillisecondsSinceEpoch(startDate * 1000)
                  //     : DateTime.fromMillisecondsSinceEpoch(endDate * 1000),
                  initialDate: tempSelectedDate,
                  // currentDate: tempSelectedDate,
                  currentDate: onTapButton == true
                      ? tempSelectedDate
                      : isStartDate
                          ? DateTime.fromMillisecondsSinceEpoch(
                              startDate * 1000)
                          : DateTime.fromMillisecondsSinceEpoch(endDate * 1000),
                  firstDate: DateTime(1000),
                  lastDate: DateTime(4100),
                  // selectableDayPredicate:(day) {
                  //   print('day : $day');
                  //   return true;
                  // },
                  // onDateChanged: onDateChanged,
                  onDateChanged: (date) {
                    st(() => tempSelectedDate = date);
                    st(() {
                      onTapButton = false;
                    });
                    print('onDateChanged => date : $date');
                  },
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Icon(Icons.calendar_today, size: 18, color: Colors.blue),
                      Image.asset(EmpIcon.calender),
                      SizedBox(width: 5),
                      Text(
                        DateFormat('d MMM yyyy').format(tempSelectedDate),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomTxtBtn(
                        title: 'Cancel',
                        color: EmpColors.primary.withOpacity(0.2),
                        titleColor: EmpColors.primary,
                        // onTap: onTapCancel,
                        onTap: () {
                          // Navigator.pop(context, selectedDate);
                          DateTime d = isStartDate
                              ? EmpDateTimeConvert.getDateTimeFromTimeStamp(
                                  startDate)
                              : EmpDateTimeConvert.getDateTimeFromTimeStamp(
                                  endDate);
                          Navigator.pop(context, d);
                        },
                      ),
                      SizedBox(width: 16),
                      CustomTxtBtn(
                        title: 'Save',
                        titleColor: EmpColors.secondary,
                        color: EmpColors.primary,
                        // onTap: onTapSave,
                        onTap: () {
                          selectedDate = tempSelectedDate;
                          // return selectedDate;
                          st(() {});
                          Navigator.pop(context, selectedDate);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _quickSelectButton(
      String label, DateTime date, Function(DateTime) onSelected) {
    return Expanded(
      child: CustomTxtBtn(
        onTap: () => onSelected(date),
        title: label,
        color: EmpColors.primary,
        titleColor: EmpColors.secondary,
        // child: Text(label,
        //     style: TextStyle(fontSize: 12, color: EmpColors.secondary)),
      ),
    );
  }

  DateTime _getNextWeekday(int weekday) {
    DateTime now = DateTime.now();
    int daysUntilNext = (weekday - now.weekday + 7) % 7;
    return now.add(Duration(days: daysUntilNext == 0 ? 7 : daysUntilNext));
  }
}
