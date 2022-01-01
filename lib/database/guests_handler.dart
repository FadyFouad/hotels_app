import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 00:31.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class GuestDataBaseHandler {
  Logger log = Logger();

  Future<int> insertGuest(List<GuestModel> guests) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    for (var guest in guests) {
      var getRows = await db
          .rawQuery('SELECT * FROM $guestsTableName WHERE id="${guest.id}"');
      if (getRows.isEmpty) {
        result = await db.insert(guestsTableName, guest.toMap()).catchError((e) {
          log.e(e);
        });
      } else {
        throw Exception('The guest already exists');
      }
    }
    return result;
  }

  Future<List<GuestModel>> retrieveGuest() async {
    final Database db = await DatabaseHandler().initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(
        guestsTableName);
    return queryResult.map((e) => GuestModel.fromMap(e)).toList();
  }

  Future<bool> updateGuest(int id, Map<String, dynamic> guest) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    result = await db
        .update(guestsTableName, guest, where: 'id = ?',whereArgs: [id])
        .catchError((e) {
      log.e(e);
      result = 0;
    });
    log.i(result);
    return result > 0;
  }

  Future<void> deleteGuest(int id,) async {
    final db = await DatabaseHandler().initializeDB();
    await db.delete(
      guestsTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}