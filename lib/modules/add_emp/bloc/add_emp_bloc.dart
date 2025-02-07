import 'package:employee_management/modules/sqflite_database/emp_model.dart';
import 'package:employee_management/modules/sqflite_database/database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_emp_event.dart';
part 'add_emp_state.dart';

class AddEmpBloc extends Bloc<AddEmpEvent, AddEmpState> {
  final DatabaseService _databaseService = DatabaseService();
  AddEmpBloc() : super(AddEmpInitial()) {
    on<SaveEmpEvent>(_callAddEmp);
    on<UpdateEmpEvent>(_callUpdateEmp);
  }

  ///
  /// ADD EMPLOYEE
  ///
  _callAddEmp(
    SaveEmpEvent event,
    Emitter<AddEmpState> emit,
  ) async {
    try {
      emit(AddEmpInitial());
      emit(AddEmpLoading());
      await _databaseService
          .insertEmployee(Employee(
              name: event.name,
              role: event.role,
              toDate: event.toDate,
              fromDate: event.fromDate,
              createdAt: event.createdAt))
          .then((aData) {
        emit(AddEmpLoaded(Employee(
          name: event.name,
          role: event.role,
          toDate: event.toDate,
          fromDate: event.fromDate,
          createdAt: event.createdAt,
        )));
        // emit(AddEmpError('Employee not added'));
      });
    } catch (e) {
      print('_callAddEmp => ERROR : $e');
      emit(AddEmpError('Employee not added'));
    }
  }

  ///
  /// UPDATE EMPLOYEE
  ///
  _callUpdateEmp(
    UpdateEmpEvent event,
    Emitter<AddEmpState> emit,
  ) async {
    try {
      emit(AddEmpInitial());
      emit(AddEmpLoading());
      await _databaseService
          .updateEmployee(Employee(
              id: event.id,
              name: event.name,
              role: event.role,
              toDate: event.toDate,
              fromDate: event.fromDate,
              createdAt: event.createdAt))
          .then((aData) {
        emit(AddEmpLoaded(Employee(
          name: event.name,
          role: event.role,
          toDate: event.toDate,
          fromDate: event.fromDate,
          createdAt: event.createdAt,
        )));
        // emit(AddEmpError('Employee not added'));
      });
    } catch (e) {
      print('_callUpdateEmp => ERROR : $e');
      emit(AddEmpError('Employee not Updated'));
    }
  }
}
