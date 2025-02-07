import 'dart:convert';

class Employee {
  final int? id;
  final String name;
  final String role;
  final int toDate;
  final int fromDate;
  final int createdAt;

  Employee({
    this.id,
    required this.name,
    required this.role,
    required this.toDate,
    required this.fromDate,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'toDate': toDate,
      'fromDate': fromDate,
      'createdAt': createdAt,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      toDate: map['toDate']?.toInt() ?? 0,
      fromDate: map['fromDate']?.toInt() ?? 0,
      createdAt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, role: $role, toDate: $toDate, fromDate: $fromDate)';
  }
}
