import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:23.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class Room{
  int id;
  int roomNumber ;
  int numOfBeds;
  String view;
  String level;
  bool isForSmoking;
  bool isEmpty;

  Room({
    required this.id,
    required this.roomNumber,
    required this.numOfBeds,
    required this.view,
    required this.level,
    required this.isForSmoking,
    required this.isEmpty,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'roomNumber': this.roomNumber,
      'numOfBeds': this.numOfBeds,
      'view': this.view,
      'level': this.level,
      'isForSmoking': this.isForSmoking,
      'isEmpty': this.isEmpty,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as int,
      roomNumber: map['roomNumber'] as int,
      numOfBeds: map['numOfBeds'] as int,
      view: map['view'] as String,
      level: map['level'] as String,
      isForSmoking: map['isForSmoking'] as bool,
      isEmpty: map['isEmpty'] as bool,
    );
  }
}