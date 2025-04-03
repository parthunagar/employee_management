// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:employee_management/components/date_picker.dart';
import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:employee_management/emp_utils/emp_datetime_convert.dart';
import 'package:employee_management/emp_utils/emp_icon_utils.dart';
import 'package:employee_management/emp_utils/emp_if_else_util.dart';
import 'package:employee_management/emp_utils/emp_snackbar_util.dart';
import 'package:employee_management/components/emp_app_bar.dart';
import 'package:employee_management/components/emp_input_field.dart';
import 'package:employee_management/components/emp_progressbar.dart';
import 'package:employee_management/components/emp_text_button.dart';
import 'package:employee_management/modules/add_emp/bloc/add_emp_bloc.dart';
import 'package:employee_management/modules/sqflite_database/database_service.dart';
import 'package:employee_management/modules/sqflite_database/emp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddEmpScreen extends StatefulWidget {
  Employee? employeeData;
  AddEmpScreen({super.key, this.employeeData});

  @override
  // ignore: library_private_types_in_public_api
  _AddEmpScreenState createState() => _AddEmpScreenState();
}

class _AddEmpScreenState extends State<AddEmpScreen> {
  bool isExpand = false;
  bool isSeminarUser = false;

  List roleList = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];
  // String roleVal = 'Select';
  TextEditingController cEmpName = TextEditingController();
  TextEditingController cRole = TextEditingController();
  TextEditingController cToDate = TextEditingController();
  TextEditingController cFromDate = TextEditingController();
  int startDate = 0;
  int endDate = 0;
  AddEmpBloc addEmpBloc = AddEmpBloc();

  @override
  void initState() {
    super.initState();
    if (widget.employeeData != null) {
      Employee d = widget.employeeData!;
      cEmpName.text = d.name.toString();
      cRole.text = d.role.toString();
      // DateTime dt = DateTime.fromMillisecondsSinceEpoch(d.toDate);
      // String formattedDate = DateFormat('d MMM yyyy').format(dt);
      cToDate.text = EmpDateTimeConvert.getFormateDate(d.toDate);
      startDate = d.toDate;
      if (d.fromDate != 0) {
        cFromDate.text = EmpDateTimeConvert.getFormateDate(d.fromDate);
        endDate = d.fromDate;
      }
    }
  }

  // DateTime selectedDate = DateTime.now();

  Future<DateTime?> _showDatePickerDialog(bool isStartDate) async {
    // DateTime tempSelectedDate = selectedDate;
    DateTime? result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return DatePickerWidget(
          startDate: startDate,
          endDate: endDate,
          isStartDate: isStartDate,
          // onTapToday: (date) {
          //   st(() => tempSelectedDate = date);
          // },
          // onTapNextMonday: (date) {
          //   st(() => tempSelectedDate = date);
          // },
          // onTapNextTuesday: (date) {
          //   st(() => tempSelectedDate = date);
          // },
          // onTap1Week: (date) {
          //   st(() => tempSelectedDate = date);
          // },
          // selectedDate: selectedDate,
          // onDateChanged: (date) {
          //   st(() => tempSelectedDate = date);
          // },
          // onTapCancel: () {
          //   Navigator.pop(context, selectedDate);
          // },
          // onTapSave: () {
          //   selectedDate = tempSelectedDate;
          //   // return selectedDate;
          //   st(() {});
          //   Navigator.pop(context, selectedDate);
          // },
        );
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    // var txtTheme = Theme.of(context).textTheme.bodyMedium!;
    return Scaffold(
      backgroundColor: EmpColors.secondary,
      appBar: CustomAppBar(
        title: widget.employeeData == null
            ? 'Add Employee Details'
            : 'Edit Employee Details',
        showLeading: false,
        actions: [
          Conditional.ifelse(
            widget.employeeData == null,
            valid: SizedBox(),
            invalid: IconButton(
              onPressed: () {
                DatabaseService ds = DatabaseService();
                ds.deleteEmployee(widget.employeeData!.id!).then((val) {
                  setState(() {});
                  EmpSnackbarUtil.showSnackBarWithAction(
                    context,
                    'Employee data has been deleted',
                    onTap: () {},
                    showUndo: false,
                  );
                  Navigator.pop(context);
                });
                setState(() {});
              },
              icon: Image.asset(EmpIcon.delete),
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmpInputTextField(
                  label: 'Employee name',
                  hintText: 'Employee name',
                  controller: cEmpName,
                  prefixIcon: Image.asset(EmpIcon.person),
                ),
                SizedBox(height: 16),
                EmpInputTextField(
                  label: 'Select Role',
                  hintText: 'Select Role',
                  readOnly: true,
                  controller: cRole,
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: EmpColors.primary,
                    size: 30,
                  ),
                  onTap: () {
                    _openBottomSheet();
                  },
                  prefixIcon: Image.asset(EmpIcon.suitcase),
                ),
                // CustomDropdownV2(
                //   dropdownValue: 'Full Stack Developer',
                //   items: [
                //     'Full Stack Developer',
                //     'Senior Software developer',
                //     'Flutter Developer',
                //   ],
                //   offset: const Offset(0, 330),
                //   // offset: Offset(0, 100),
                //   onChanged: (newValue) {
                //     setState(() {
                //       // dropdownValue = newValue.toString();
                //     });
                //   },
                // ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: EmpInputTextField(
                        label: 'No Date',
                        hintText: 'No Date',
                        readOnly: true,
                        controller: cToDate,
                        onTap: () {
                          _datePicker(true);
                          setState(() {});
                          // _showDatePickerDialog(true);
                        },
                        prefixIcon: Image.asset(EmpIcon.calender),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(EmpIcon.rightArrow),
                    ),
                    Expanded(
                      child: EmpInputTextField(
                        label: 'No Date',
                        hintText: 'No Date',
                        readOnly: true,
                        controller: cFromDate,
                        onTap: () {
                          _datePicker(false);
                          setState(() {});
                          // _showDatePickerDialog(false);
                        },
                        prefixIcon: Image.asset(EmpIcon.calender),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(thickness: 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12)
                    .copyWith(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTxtBtn(
                      title: 'Cancel',
                      color: EmpColors.primary.withOpacity(0.2),
                      titleColor: EmpColors.primary,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 16),
                    BlocProvider(
                      create: (_) => addEmpBloc,
                      child: BlocListener<AddEmpBloc, AddEmpState>(
                        listener: (context, state) {
                          if (state is AddEmpError) {
                            EmpSnackbarUtil.showSnackBar(
                                context, state.message.toString());
                          }
                          if (state is AddEmpLoaded) {
                            Navigator.pop(context);
                          }
                        },
                        child: BlocBuilder<AddEmpBloc, AddEmpState>(
                            builder: (context, state) {
                          return Conditional.ifelse(
                            state is AddEmpLoading,
                            valid: EmpProgressbar(),
                            invalid: CustomTxtBtn(
                              title: 'Save',
                              titleColor: EmpColors.secondary,
                              color: EmpColors.primary,
                              onTap: () {
                                if (cEmpName.text.isEmpty) {
                                  EmpSnackbarUtil.showSnackBar(
                                      context, 'Please Enter Employee Name');
                                } else if (cRole.text.isEmpty) {
                                  EmpSnackbarUtil.showSnackBar(
                                      context, 'Please Select Employee Role');
                                } else if (cToDate.text.isEmpty) {
                                  EmpSnackbarUtil.showSnackBar(
                                      context, 'Please Select From Date');
                                } else {
                                  print(
                                      'cToDate : ${cToDate.text} || cFromDate : ${cFromDate.text}');
                                  print('sd : $startDate || ed : $endDate');
                                  if (widget.employeeData == null) {
                                    addEmpBloc.add(SaveEmpEvent(
                                      name: cEmpName.text,
                                      role: cRole.text,
                                      toDate: startDate,
                                      fromDate: endDate,
                                      createdAt: EmpDateTimeConvert
                                          .getTimeStampFromDate(DateTime.now()),
                                    ));
                                  } else {
                                    Employee d = widget.employeeData!;
                                    addEmpBloc.add(UpdateEmpEvent(
                                      id: d.id!,
                                      name: cEmpName.text, //d.name,
                                      role: cRole.text, //d.role,
                                      toDate: startDate,
                                      fromDate: endDate,
                                      createdAt: d.createdAt,
                                    ));
                                  }
                                }
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _datePicker(bool isStartDate) async {
    print('_datePicker => startDate 1 : $startDate');
    if (startDate == 0 && isStartDate == true) {
      startDate = EmpDateTimeConvert.getDateInSeconds(0, true);
    }
    if (endDate == 0 && isStartDate == false) {
      endDate = EmpDateTimeConvert.getDateInSeconds(0, false);
    }
    print('_datePicker => startDate 2 : $startDate');
    DateTime dt = DateTime.now();
    // DateTime? picked = await showDatePicker(
    //   context: context,
    //   // firstDate: isStartDate ? DateTime(2015, 8) : (startDate == 0 ? DateTime(2015, 8) : DateTime.fromMillisecondsSinceEpoch(startDate * 1000)),
    //   firstDate: DateTime(2015, 8),
    //   initialDate: isStartDate
    //       ? DateTime.fromMillisecondsSinceEpoch(startDate * 1000)
    //       : DateTime.fromMillisecondsSinceEpoch(endDate * 1000),
    //   // lastDate: isStartDate ? DateTime.fromMillisecondsSinceEpoch(endDate * 1000) : DateTime(dt.year, dt.month + 1, 30),
    //   lastDate: DateTime(3015, 8),
    //   helpText: '',
    //   cancelText: 'Cancel',
    //   confirmText: 'Save',
    //   builder: (BuildContext context, Widget? child) {
    //     return Theme(
    //       data: ThemeData.light().copyWith(
    //         primaryColor: EmpColors.primary,
    //         buttonTheme:
    //             const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    //         colorScheme: const ColorScheme.light(primary: EmpColors.primary)
    //             .copyWith(secondary: EmpColors.primary),
    //       ),
    //       child: child ?? Container(),
    //     );
    //   },
    // );

    DateTime? picked = await _showDatePickerDialog(isStartDate);
    print('picked : $picked');
    setState(() {});
    if (picked != null) {
      if (isStartDate) {
        startDate = (picked.millisecondsSinceEpoch / 1000).round() + 1;
      } else {
        endDate = (picked.millisecondsSinceEpoch / 1000).round() + 1;
      }
    } else {
      print('_datePicker => startDate 3 : $startDate');

      ///
      ///SET DATE WHITE DATE NOT SELECTED AND CLICK ON CANCEL
      ///
      // picked = dt;
      if (isStartDate && startDate == 0) {
        picked = dt;
      } else {
        picked = dt;
      }
      // else if (endDate == 0) {
      //   picked = dt;
      // }
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        picked?.millisecondsSinceEpoch ?? 0);
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    if (isStartDate) {
      cToDate.text = formattedDate;
    } else {
      cFromDate.text = formattedDate;
    }
    setState(() {});
  }

  _openBottomSheet() {
    var txtTheme = Theme.of(context).textTheme.bodyMedium!;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 5),
          shrinkWrap: true,
          itemCount: roleList.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: EmpColors.light,
              thickness: 0.5,
            );
          },
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  cRole.text = roleList[i];
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  roleList[i],
                  textAlign: TextAlign.center,
                  style: txtTheme.copyWith(fontSize: 16),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
