import 'package:employee_management/modules/sqflite_database/emp_model.dart';
import 'package:employee_management/modules/sqflite_database/database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'emp_list_event.dart';
part 'emp_list_state.dart';

class EmpListBloc extends Bloc<EmpListEvent, EmpListState> {
  final DatabaseService _databaseService = DatabaseService();

  EmpListBloc() : super(GetEmpListInitial()) {
    on<GetEmpList>((event, emit) async {
      try {
        emit(GetEmpListLoading());
        await _databaseService.employees().then((menuVal) {
          // ignore: unnecessary_null_comparison
          if (menuVal != null) {
            emit(GetEmpListLoaded(menuVal));
          } else {
            emit(GetEmpListError('Data Not Found'));
          }
        });
      } catch (e) {
        emit(GetEmpListError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
