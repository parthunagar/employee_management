part of 'add_emp_bloc.dart';

abstract class AddEmpEvent extends Equatable {
  const AddEmpEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SaveEmpEvent extends AddEmpEvent {
  int toDate;
  int fromDate;
  String role;
  String name;
  int createdAt;
  SaveEmpEvent({
    required this.name,
    required this.role,
    required this.toDate,
    required this.fromDate,
    required this.createdAt,
  });
}

// ignore: must_be_immutable
class UpdateEmpEvent extends AddEmpEvent {
  int toDate, id;
  int fromDate;
  String role;
  String name;
  int createdAt;
  UpdateEmpEvent({
    required this.id,
    required this.name,
    required this.role,
    required this.toDate,
    required this.fromDate,
    required this.createdAt,
  });
}
