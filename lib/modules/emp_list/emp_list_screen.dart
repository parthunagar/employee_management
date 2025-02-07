import 'package:auto_route/auto_route.dart';
import 'package:employee_management/components/emp_placeholder.dart';
import 'package:employee_management/emp_utils/emp_colors_utils.dart';
import 'package:employee_management/emp_utils/emp_datetime_convert.dart';
import 'package:employee_management/emp_utils/emp_icon_utils.dart';
import 'package:employee_management/emp_utils/emp_snackbar_util.dart';
import 'package:employee_management/components/emp_app_bar.dart';
import 'package:employee_management/components/emp_progressbar.dart';
import 'package:employee_management/modules/emp_list/bloc/emp_list_bloc.dart';
import 'package:employee_management/modules/sqflite_database/emp_model.dart';
import 'package:employee_management/modules/sqflite_database/database_service.dart';
import 'package:employee_management/route/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

//@RoutePage(name: 'LoginRoute')
class EmpList extends StatefulWidget {
  const EmpList({super.key});

  @override
  State<EmpList> createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  EmpListBloc empListBloc = EmpListBloc();

  @override
  void initState() {
    super.initState();
    empListBloc.add(GetEmpList());
  }

  List<Employee> currentEmpList = [];
  List<Employee> previousEmpList = [];

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme.bodyMedium!;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    headertile(String title) {
      return Container(
        width: w,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        // ignore: deprecated_member_use
        color: EmpColors.primary.withOpacity(0.2),
        child: Text(
          title,
          style: txtTheme.copyWith(
            fontWeight: FontWeight.bold,
            color: EmpColors.primary,
            fontSize: 16,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Employee List',
        showLeading: false,
      ),
      body: BlocProvider(
        create: (_) => empListBloc,
        child: BlocListener<EmpListBloc, EmpListState>(
          listener: (context, state) {
            if (state is GetEmpListError) {
              // EmpSnackbarUtil.showSnackBar(
              //   context,
              //   state.message.toString(),
              // );
            }
            if (state is GetEmpListLoaded) {
              List<Employee> data = state.empList;
              previousEmpList.clear();
              currentEmpList.clear();
              previousEmpList = data.where((e) => e.fromDate == 0).toList();
              previousEmpList
                  .sort((a, b) => b.createdAt.compareTo(a.createdAt));
              currentEmpList = data.where((e) => e.fromDate != 0).toList();
              currentEmpList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
              // print('currentEmpList : ${currentEmpList.length} || previousEmpList : ${previousEmpList.length}');
              setState(() {});
            }
          },
          child: BlocBuilder<EmpListBloc, EmpListState>(
            builder: (context, state) {
              if (state is GetEmpListInitial) {
                return EmpProgressbar();
              } else if (state is GetEmpListLoading) {
                return EmpProgressbar();
              } else if (state is GetEmpListLoaded) {
                if (state.empList.isEmpty) {
                  return PlaceHolderWidget();
                }
                return Column(
                  children: [
                    SizedBox(
                      height: h / 2.4,
                      child: Column(
                        children: [
                          headertile('Current employees'),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              // itemCount: state.empList.length,
                              itemCount: previousEmpList.length,
                              separatorBuilder: (context, index) {
                                return Divider(thickness: 0.1, height: 1);
                              },
                              itemBuilder: (context, i) {
                                Employee data = previousEmpList[i];
                                return _ListTile(
                                  onTap: () async {
                                    await AutoRouter.of(context)
                                        .push(AddEmpRoute(employeeData: data));
                                    empListBloc.add(GetEmpList());
                                  },
                                  onTapDelete: (handler) async {
                                    DatabaseService ds = DatabaseService();
                                    ds.deleteEmployee(data.id!).then((val) {
                                      empListBloc.add(GetEmpList());
                                      setState(() {});
                                      EmpSnackbarUtil.showSnackBarWithAction(
                                          context,
                                          'Employee data has been deleted',
                                          onTap: () async {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();

                                        await ds.insertEmployee(
                                          Employee(
                                            name: data.name,
                                            role: data.role,
                                            toDate: data.toDate,
                                            fromDate: data.fromDate,
                                            createdAt: data.createdAt,
                                            id: data.id,
                                          ),
                                        );
                                        empListBloc.add(GetEmpList());
                                        setState(() {});
                                      });
                                    });
                                    setState(() {});
                                  },
                                  fromDate: data.fromDate,
                                  toDate: data.toDate,
                                  name: data.name,
                                  role: data.role,
                                  id: data.id!,
                                  createdAt: data.createdAt,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // height: h / 2.5,
                      child: Column(
                        children: [
                          headertile('Previous employees'),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: currentEmpList.length,
                              separatorBuilder: (context, index) {
                                return Divider(thickness: 0.1, height: 1);
                              },
                              itemBuilder: (context, i) {
                                Employee data = currentEmpList[i];
                                return _ListTile(
                                  onTap: () async {
                                    AutoRouter.of(context)
                                        .push(AddEmpRoute(employeeData: data));
                                    empListBloc.add(GetEmpList());
                                  },
                                  onTapDelete: (handler) async {
                                    DatabaseService ds = DatabaseService();
                                    ds.deleteEmployee(data.id!).then((val) {
                                      empListBloc.add(GetEmpList());
                                      setState(() {});
                                      EmpSnackbarUtil.showSnackBarWithAction(
                                          context,
                                          'Employee data has been deleted',
                                          onTap: () async {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();

                                        await ds.insertEmployee(
                                          Employee(
                                            name: data.name,
                                            role: data.role,
                                            toDate: data.toDate,
                                            fromDate: data.fromDate,
                                            createdAt: data.createdAt,
                                            id: data.id,
                                          ),
                                        );
                                        empListBloc.add(GetEmpList());
                                        setState(() {});
                                      });
                                    });
                                    setState(() {});
                                  },
                                  fromDate: data.fromDate,
                                  toDate: data.toDate,
                                  name: data.name,
                                  role: data.role,
                                  id: data.id!,
                                  createdAt: data.createdAt,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (state is GetEmpListError) {
                return PlaceHolderWidget();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          await AutoRouter.of(context).push(AddEmpRoute());
          empListBloc.add(GetEmpList());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: EmpColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Icon(Icons.add, color: EmpColors.secondary),
        ),
      ),
    );
  }
}

// ignore: unused_element, must_be_immutable
class _ListTile extends StatefulWidget {
  final String name, role;
  final int toDate, fromDate, id, createdAt;
  void Function(Future<void> Function(bool)) onTapDelete;
  void Function()? onTap;
  _ListTile({
    required this.fromDate,
    required this.toDate,
    required this.name,
    required this.role,
    required this.id,
    required this.createdAt,
    required this.onTapDelete,
    required this.onTap,
  });

  @override
  State<_ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<_ListTile> {
  late SwipeActionController controller;

  @override
  void initState() {
    super.initState();
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme.bodyMedium!;
    return GestureDetector(
      onTap: widget.onTap,
      child: SwipeActionCell(
        controller: controller,
        // index: index,
        key: ValueKey(widget.toDate.toString()),
        selectedForegroundColor: Colors.black.withAlpha(30),
        trailingActions: [
          SwipeAction(
            icon: Image.asset(EmpIcon.delete),
            performsFirstActionWithFullSwipe: false,
            // nestedAction: SwipeNestedAction(title: "confirm"),
            onTap: widget.onTapDelete,
          ),
        ],

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: txtTheme.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.role,
                style: txtTheme.copyWith(
                  fontWeight: FontWeight.w400,
                  color: EmpColors.dark,
                  fontSize: 14,
                ),
              ),
              Text(
                widget.fromDate == 0
                    ? 'From ${EmpDateTimeConvert.getDateAndTimeFromTimeStamp(widget.toDate)}'
                    : '${EmpDateTimeConvert.getDateAndTimeFromTimeStamp(widget.toDate)},${EmpDateTimeConvert.getDateAndTimeFromTimeStamp(widget.fromDate)}',
                style: txtTheme.copyWith(
                  fontWeight: FontWeight.w400,
                  color: EmpColors.dark,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
