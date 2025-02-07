part of 'emp_list_bloc.dart';

abstract class EmpListEvent extends Equatable {
  const EmpListEvent();

  @override
  List<Object> get props => [];
}

class GetEmpList extends EmpListEvent {}
