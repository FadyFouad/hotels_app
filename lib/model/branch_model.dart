
/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:20.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class BranchModel {
  BranchModel({
     this.id,
     this.address,
     this.stars,
     this.roomId,
     this.guestModelId,
     this.employeeModelId,
     this.bookingIds,});

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
    id : map['id'],
    address : map['address'] ?? '',
    stars : map['stars'] ?? '',
    roomId : map['rooms'] != '' ? '${map['rooms']}'.split(",").map(int.parse).toList():[],
    guestModelId:  map['rooms'] != '' ? '${map['rooms']}'.split(",").map(int.parse).toList():[],
    employeeModelId :  map['rooms'] != '' ? '${map['rooms']}'.split(",").map(int.parse).toList():[],
    bookingIds :  map['bookings'] != '' ? '${map['bookings']}'.split(",").map(int.parse).toList():[],
    );
  }
  int? id;
  String? address;
  int? stars;
  List<int>? roomId;
  List<int>? guestModelId;
  List<int>? employeeModelId;
  List<int>? bookingIds;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['stars'] = stars;
    if (roomId != null) {
      map['rooms'] = roomId!.join(',');
    }
    if (guestModelId != null) {
      map['guests'] = guestModelId!.join(',');
    }
    if (employeeModelId != null) {
      map['employees'] = employeeModelId!.join(',');
    }
    if (bookingIds != null) {
      map['bookings'] = bookingIds!.join(',');
    }
    return map;
  }
}
