import 'package:flutter/material.dart';
import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/room_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 00:35.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class RoomsDataBaseHandler {
  Logger log = Logger();

  Future<int> insertRooms(List<Room> rooms) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    for (var room in rooms) {
      var getRows = await db
          .rawQuery('SELECT * FROM $roomsTableName WHERE id="${room.id}"');
      if (getRows.isEmpty) {
        result = await db.insert(roomsTableName, room.toMap()).catchError((e) {
          log.e(e);
        });
      } else {
        throw Exception('The Room already exists');
      }
    }
    return result;
  }

  Future<List<Room>> retrieveRooms() async {
    final Database db = await DatabaseHandler().initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(
        roomsTableName);
    return queryResult.map((e) => Room.fromMap(e)).toList();
  }

  Future<bool> updateRoom(int id, Map<String, dynamic> room) async {
    int result = 0;
    final Database db = await DatabaseHandler().initializeDB();
    result = await db
        .update(roomsTableName, room, where: 'id =$id')
        .catchError((e) {
      log.e(e);
      result = 0;
    });
    log.i(result);
    return result > 0;
  }

  Future<void> deleteRoom(int id,) async {
    final db = await DatabaseHandler().initializeDB();
    await db.delete(
      roomsTableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}