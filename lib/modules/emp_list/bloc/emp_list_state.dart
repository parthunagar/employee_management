part of 'emp_list_bloc.dart';

abstract class EmpListState extends Equatable {
  const EmpListState();

  @override
  List<Object?> get props => [];
}

class GetEmpListInitial extends EmpListState {}

class GetEmpListLoading extends EmpListState {}

class GetEmpListLoaded extends EmpListState {
  final List<Employee> empList;
  const GetEmpListLoaded(this.empList);
  // const GetEmpListLoaded();
}

class GetEmpListError extends EmpListState {
  final String? message;
  const GetEmpListError(this.message);
}
