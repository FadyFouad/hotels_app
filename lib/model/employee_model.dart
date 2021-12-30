import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:24.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class EmployeeModel{
  int id;
  String name;
  String phone;
  String branchId;
  String privileges;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.branchId,
    required this.privileges,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'phone': this.phone,
      'branchId': this.branchId,
      'privileges': this.privileges,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      branchId: map['branchId'] as String,
      privileges: map['privileges'] as String,
    );
  }
}