import 'package:employee_management/modules/sqflite_database/emp_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' show Platform;
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
      return await openDatabase(
        'flutter_sqflite_database.db',
        onCreate: _onCreate,
        version: 1,
        onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
      );
    } else {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'flutter_sqflite_database.db');
      return await openDatabase(
        path,
        onCreate: _onCreate,
        version: 1,
        onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
      );
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE emp(id INTEGER PRIMARY KEY, name TEXT, role TEXT, toDate INTEGER, fromDate INTEGER, createdAt INTEGER)',
    );
  }

  Future<void> insertEmployee(Employee emp) async {
    final db = await _databaseService.database;
    try {
      await db.insert(
        'emp',
        emp.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('insertEmployee => ERROR : $e');
    }
  }

  Future<List<Employee>> employees() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('emp');
    return List.generate(maps.length, (index) => Employee.fromMap(maps[index]));
  }

  Future<Employee> employee(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('emp', where: 'id = ?', whereArgs: [id]);
    return Employee.fromMap(maps[0]);
  }

  Future<void> updateEmployee(Employee breed) async {
    final db = await _databaseService.database;
    await db.update(
      'emp',
      breed.toMap(),
      where: 'id = ?',
      whereArgs: [breed.id],
    );
  }

  Future<void> deleteEmployee(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'emp',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
