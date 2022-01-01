import 'package:flutter/material.dart';
import 'package:hotels_app/database/booking_handler.dart';
import 'package:hotels_app/database/branches_handler.dart';
import 'package:hotels_app/database/employee_handler.dart';
import 'package:hotels_app/database/room_handler.dart';
import 'package:hotels_app/model/booking_model.dart';
import 'package:hotels_app/model/branch_model.dart';
import 'package:hotels_app/model/employee_model.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:hotels_app/model/room_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'guests_handler.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 31-Dec-21 at 16:20.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

const databaseVersion = 3;
const branchesTableName = 'branches';
const roomsTableName = 'rooms';
const guestsTableName = 'guests';
const employeesTableName = 'employees';
const bookingsTableName = 'bookings';

class DatabaseHandler {
  Logger log = Logger();

  Future<Database> initializeDB() async {
    /// Automatically get the database folder according to the current OS
    String path = await getDatabasesPath();

    /// Use 'join' to correctly build the path to the database file
    final dbName = join(path, 'sampleHotels.db');


    return openDatabase(
      dbName,

      /// Called if the database doesn't exist prior to calling 'openDatabase'
      onCreate: (database, version) async {
        ///create branches table,
        createTable(
          database: database,
          sqlQuery:
              "CREATE TABLE $branchesTableName(id INTEGER PRIMARY KEY,address TEXT NOT NULL,stars INTEGER,rooms TEXT,guests TEXT,employees TEXT,bookings TEXT)",
        );

        ///create rooms table,
        createTable(
            database: database,
            sqlQuery:
                "CREATE TABLE $roomsTableName(id INTEGER PRIMARY KEY,roomNumber INTEGER,numOfBeds INTEGER,view TEXT,level TEXT,isForSmoking INTEGER,isEmpty INTEGER)"); // Boolean values are stored as integers 0 (false) and 1 (true).

        ///create guests table,
        createTable(
            database: database,
            sqlQuery:
                "CREATE TABLE $guestsTableName(id INTEGER PRIMARY KEY,branchId INTEGER,roomId INTEGER,name TEXT,email TEXT,phone TEXT,address TEXT)");

        ///create employees table,
        createTable(
            database: database,
            sqlQuery:
                "CREATE TABLE $employeesTableName(id INTEGER PRIMARY KEY,name TEXT,phone TEXT,branchId INTEGER,privileges TEXT)");

        ///create bookings table,
        createTable(
            database: database,
            sqlQuery:
                "CREATE TABLE $bookingsTableName(id INTEGER PRIMARY KEY,roomId INTEGER,guestId INTEGER,branchId INTEGER,fromDate TEXT,toDate TEXT)");
        log.i('db created: ' + dbName);
        },
      version: databaseVersion,
    );

  }

  createTable({
    required Database database,
    required String sqlQuery,
  }) async {
    await database.execute(sqlQuery).catchError((e) {
      log.e(e);
    });
  }

  addDummyData(){
    _dummyData();
  }

  Future<int> insertBranch(List<BranchModel> branches) async {
    return BranchesDataBaseHandler().insertBranch(branches);
  }

  Future<bool> updateBranch(int id, Map<String, dynamic> branch) async {
    return BranchesDataBaseHandler().updateBranch(id, branch);
  }

  Future<List<BranchModel>> retrieveBranches() {
    return BranchesDataBaseHandler().retrieveBranches();
  }

  Future<void> deleteBranch(int id) {
    return BranchesDataBaseHandler().deleteBranch(id);
  }

  Future<int> insertRooms(List<Room> rooms) async {
    return RoomsDataBaseHandler().insertRooms(rooms);
  }

  Future<bool> updateRoom(int id, Map<String, dynamic> room) async {
    return RoomsDataBaseHandler().updateRoom(id, room);
  }

  Future<List<Room>> retrieveRooms() {
    return RoomsDataBaseHandler().retrieveRooms();
  }

  Future<void> deleteRoom(int id) {
    return RoomsDataBaseHandler().deleteRoom(id);
  }

  Future<int> insertBooks(List<Booking> bookings) async {
    return BookingsDataBaseHandler().insertBookings(bookings);
  }

  Future<bool> updateBook(int id, Map<String, dynamic> book) async {
    return BookingsDataBaseHandler().updateBook(id,book);
  }

  Future<List<Booking>> retrieveBookings() {
    return BookingsDataBaseHandler().retrieveBookings();
  }

  Future<void> deleteBook(int id) {
    return BookingsDataBaseHandler().deleteBook(id);
  }

  Future<int> insertGuests(List<GuestModel> guests) async {
    return GuestDataBaseHandler().insertGuest(guests);
  }

  Future<bool> updateGuest(int id, Map<String, dynamic> guest) async {
    return GuestDataBaseHandler().updateGuest(id, guest);
  }

  Future<List<GuestModel>> retrieveGuests() {
    return GuestDataBaseHandler().retrieveGuest();
  }

  Future<void> deleteGuest(int id) {
    return GuestDataBaseHandler().deleteGuest(id);
  }

  Future<int> insertEmployees(List<EmployeeModel> employees) async {
    return EmployeesDataBaseHandler().insertEmployee(employees);
  }

  Future<bool> updateEmployee(int id, Map<String, dynamic> employee) async {
    return EmployeesDataBaseHandler().updateEmployee(id, employee);
  }

  Future<List<EmployeeModel>> retrieveEmployees() {
    return EmployeesDataBaseHandler().retrieveEmployees();
  }

  Future<void> deleteEmployee(int id) {
    return EmployeesDataBaseHandler().deleteEmployees(id);
  }
}

_dummyData() {
  final rooms = [
    Room(
        id: 1,
        roomNumber: 1,
        level: '8',
        numOfBeds: 3,
        isEmpty: true,
        isForSmoking: false,
        view: '')
  ];
  final guests = [
    GuestModel(
        id: 1,
        name: 'Fady',
        address: 'Cairo',
        email: 'email',
        phone: '011',
        roomId: 1,
        branchId: 1)
  ];
  final e = [
    EmployeeModel(
      id: 1,
      name: '',
      phone: '',
      branchId: 1,
      privileges: 'admin',
    )
  ];
  final List<BranchModel> branches = [
    BranchModel(
      id: 1,
      address: 'Cairo',
      stars: 5,
      roomId: [1, 2, 3],
      guestModelId: [1],
      bookingIds: [],
      employeeModelId: [12],
    ),
  ];
  DatabaseHandler().insertBranch(branches).catchError((e) {
    debugPrint('$e');
  });
  DatabaseHandler().insertRooms(rooms).catchError((e) {
    debugPrint(e);
  });
  DatabaseHandler().insertGuests(guests).catchError((e) {
    debugPrint(e);
  });
  DatabaseHandler().insertEmployees(e).catchError((e) {
    debugPrint(e);
  });
}
