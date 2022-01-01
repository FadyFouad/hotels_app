import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/booking_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 01:20.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class BookingsDataBaseHandler {
  Logger log = Logger();

  Future<int> insertBookings(List<Booking> bookings) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    for (var book in bookings) {
      var getRows = await db
          .rawQuery('SELECT * FROM $bookingsTableName WHERE id="${book.id}"');
      if (getRows.isEmpty) {
        result = await db.insert(bookingsTableName, book.toMap()).catchError((e) {
          log.e(e);
        });
      } else {
        throw Exception('The Book already exists');
      }
    }
    return result;
  }

  Future<List<Booking>> retrieveBookings() async {
    final Database db = await DatabaseHandler().initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(bookingsTableName);
    return queryResult.map((e) => Booking.fromMap(e)).toList();
  }

  Future<bool> updateBook(int id, Map<String, dynamic> book) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    result = await db
        .update(bookingsTableName, book,  where: 'id = ?',whereArgs: [id])
        .catchError((e) {
      log.e(e);
      result = 0;
    });
    log.i(result);
    return result > 0;
  }

  Future<void> deleteBook(int id,) async {
    final db = await DatabaseHandler().initializeDB();
    await db.delete(
      bookingsTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
