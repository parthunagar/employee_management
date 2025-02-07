// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../core/auto_route_guards.dart' as _i5;
import '../modules/add_emp/add_emp.dart' as _i2;
import '../modules/emp_list/emp_list_screen.dart' as _i1;
import '../modules/sqflite_database/emp_model.dart' as _i6;

class AppRouter extends _i3.RootStackRouter {
  AppRouter({
    _i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
    required this.notAuthGuard,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i5.NotAuthGuard notAuthGuard;

  final _i5.AuthGuard authGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    EmpListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmpList(),
      );
    },
    AddEmpRoute.name: (routeData) {
      final args = routeData.argsAs<AddEmpRouteArgs>(
          orElse: () => const AddEmpRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.AddEmpScreen(
          key: args.key,
          employeeData: args.employeeData,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/empList',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          EmpListRoute.name,
          path: '/empList',
          guards: [notAuthGuard],
        ),
        _i3.RouteConfig(
          AddEmpRoute.name,
          path: '/addEmp',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.EmpList]
class EmpListRoute extends _i3.PageRouteInfo<void> {
  const EmpListRoute()
      : super(
          EmpListRoute.name,
          path: '/empList',
        );

  static const String name = 'EmpListRoute';
}

/// generated route for
/// [_i2.AddEmpScreen]
class AddEmpRoute extends _i3.PageRouteInfo<AddEmpRouteArgs> {
  AddEmpRoute({
    _i4.Key? key,
    _i6.Employee? employeeData,
  }) : super(
          AddEmpRoute.name,
          path: '/addEmp',
          args: AddEmpRouteArgs(
            key: key,
            employeeData: employeeData,
          ),
        );

  static const String name = 'AddEmpRoute';
}

class AddEmpRouteArgs {
  const AddEmpRouteArgs({
    this.key,
    this.employeeData,
  });

  final _i4.Key? key;

  final _i6.Employee? employeeData;

  @override
  String toString() {
    return 'AddEmpRouteArgs{key: $key, employeeData: $employeeData}';
  }
}
