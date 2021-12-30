import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:24.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GuestModel{
  int id;
  String branchId;
  String roomId;
  String name;
  String email;
  String phone;
  String address;

  GuestModel({
    required this.id,
    required this.branchId,
    required this.roomId,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'branchId': this.branchId,
      'roomId': this.roomId,
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
      'address': this.address,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      id: map['id'] as int,
      branchId: map['branchId'] as String,
      roomId: map['roomId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }
}