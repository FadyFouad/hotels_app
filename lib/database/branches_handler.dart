import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/branch_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 31-Dec-21 at 23:43.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class BranchesDataBaseHandler {
  Logger log = Logger();

  Future<int> insertBranch(List<BranchModel> branches) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    for (var branch in branches) {
      var getRows = await db
          .rawQuery('SELECT * FROM $branchesTableName WHERE id="${branch.id}"');
      if (getRows.isEmpty) {
        result = await db.insert(branchesTableName, branch.toMap()).catchError((e) {
          log.e(e);
        });
      } else {
        throw Exception('The branch already exists');
      }
    }
    return result;
  }

  Future<List<BranchModel>> retrieveBranches() async {
    final Database db = await DatabaseHandler().initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(branchesTableName);
    return queryResult.map((e) => BranchModel.fromMap(e)).toList();
  }

  Future<bool> updateBranch(int id, Map<String, dynamic> branch) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    result = await db
        .update(branchesTableName, branch,  where: 'id = ?',whereArgs: [id])
        .catchError((e) {
      log.e(e);
      result = 0;
    });
    log.i(result);
    return result > 0;
  }

  Future<void> deleteBranch(int id,) async {
    final db = await DatabaseHandler().initializeDB();
    await db.delete(
      branchesTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
