import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotels_app/model/branch_model.dart';
import 'package:hotels_app/model/employee_model.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:hotels_app/model/room_model.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final log = Logger();
  final List<BranchModel> list = [
    BranchModel(
      id: '1',
      address: '',
      stars: 5,
      room: Room(
          id: 1,
          roomNumber: 1,
          level: '8',
          numOfBeds: 3,
          isEmpty: true,
          isForSmoking: false,
          view: ''),
      guestModel: GuestModel(
          id: 1,
          name: 'Fady',
          address: 'Cairo',
          email: 'email',
          phone: '011',
          roomId: '1',
          branchId: '2'),
      booking: [],
      employeeModel: EmployeeModel(
          id: 1, name: '', phone: '', branchId: '1', privileges: 'admin'),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    log.i(list[0].toMap());
    return const Scaffold(
      backgroundColor: Color(0xff2446a6),
      body: SafeArea(
        child: Text(''),
      ),
    );
  }
}
