import 'package:auto_route/annotations.dart';
import 'package:employee_management/core/auto_route_guards.dart';
import 'package:employee_management/modules/add_emp/add_emp.dart';
import 'package:employee_management/modules/emp_list/emp_list_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        path: '/empList',
        name: 'EmpListRoute',
        page: EmpList,
        initial: true,
        guards: [NotAuthGuard]),
    AutoRoute(
        path: '/addEmp',
        name: 'AddEmpRoute',
        page: AddEmpScreen,
        guards: [AuthGuard]),
  ],
)
class $AppRouter {}
