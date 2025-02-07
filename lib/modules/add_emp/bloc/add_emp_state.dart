part of 'add_emp_bloc.dart';

abstract class AddEmpState extends Equatable {
  const AddEmpState();

  @override
  List<Object?> get props => [];
}

class AddEmpInitial extends AddEmpState {}

class AddEmpLoading extends AddEmpState {}

class AddEmpLoaded extends AddEmpState {
  final Employee employee;
  const AddEmpLoaded(this.employee);
}

class AddEmpError extends AddEmpState {
  final String? message;
  const AddEmpError(this.message);
}
