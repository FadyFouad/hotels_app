import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/employee_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 00:40.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class EmployeesDataBaseHandler {
  Logger log = Logger();

  Future<int> insertEmployee(List<EmployeeModel> employees) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    for (var employee in employees) {
      var getRows = await db
          .rawQuery('SELECT * FROM $employeesTableName WHERE id="${employee.id}"');
      if (getRows.isEmpty) {
        result = await db.insert(employeesTableName, employee.toMap()).catchError((e) {
          log.e(e);
        });
      } else {
        throw Exception('The Employee already exists');
      }
    }
    return result;
  }

  Future<List<EmployeeModel>> retrieveEmployees() async {
    final Database db = await DatabaseHandler().initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(employeesTableName);
    return queryResult.map((e) => EmployeeModel.fromMap(e)).toList();
  }

  Future<bool> updateEmployee(int id, Map<String, dynamic> branch) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    result = await db
        .update(employeesTableName, branch,  where: 'id = ?',whereArgs: [id])
        .catchError((e) {
      log.e(e);
      result = 0;
    });
    log.i(result);
    return result > 0;
  }

  Future<void> deleteEmployees(int id,) async {
    final db = await DatabaseHandler().initializeDB();
    await db.delete(
      employeesTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
