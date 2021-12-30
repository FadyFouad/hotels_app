import 'package:hotels_app/model/booking_model.dart';
import 'package:hotels_app/model/employee_model.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:hotels_app/model/room_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:20.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class BranchModel {
  BranchModel({
    required this.id,
    required this.address,
    required this.stars,
    this.room,
    this.guestModel,
    this.employeeModel,
    this.booking,});

  //
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': this.id,
  //     'address': this.address,
  //     'stars': this.stars,
  //     'room': this.room,
  //     'guest': this.guest,
  //     'employee': this.employee,
  //     'bookings': this.bookings,
  //   };
  // }
  //
  //
  // factory BranchModel.fromMap(Map<String, dynamic> map) {
  //   return BranchModel(
  //     id: map['id'] as String,
  //     address: map['address'] as String,
  //     stars: map['stars'] as int,
  //     room: map['room'] as Room,
  //     guest: map['guest'] as GuestModel,
  //     employee: map['employee'] as EmployeeModel,
  //     bookings: map['bookings'] as List<Booking>,
  //   );
  // }

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    List<Booking> tempBooking = [];
    map['Booking'].forEach((v) {
      tempBooking.add(Booking.fromMap(v));
    });
    return BranchModel(
    id : map['id'],
    address : map['address'] ?? '',
    stars : map['stars'] ?? '',
    room : map['Room'] != null ? Room.fromMap(map['Room']) : null,
    guestModel:map['GuestModel'] != null ? GuestModel.fromMap(map['GuestModel']) : null,
    employeeModel : map['EmployeeModel'] != null ? EmployeeModel.fromMap(map['EmployeeModel']) : null,
    booking : tempBooking,
    );
  }
  String id;
  String address;
  int stars;
  Room? room;
  GuestModel? guestModel;
  EmployeeModel? employeeModel;
  List<Booking>? booking;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['stars'] = stars;
    if (room != null) {
      map['Room'] = room?.toMap();
    }
    if (guestModel != null) {
      map['GuestModel'] = guestModel?.toMap();
    }
    if (employeeModel != null) {
      map['EmployeeModel'] = employeeModel?.toMap();
    }
    if (booking != null) {
      map['Booking'] = booking?.map((v) => v.toMap()).toList();
    }
    return map;
  }

}
