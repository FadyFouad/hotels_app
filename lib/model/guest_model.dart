
/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:24.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GuestModel{
  int? id;
  int? branchId;
  int? roomId;
  String? name;
  String? email;
  String? phone;
  String? address;

  GuestModel({
    this.id,
    this.branchId,
    this.roomId,
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branchId': branchId,
      'roomId': roomId,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      id: map['id'] as int,
      branchId: map['branchId'] as int,
      roomId: map['roomId'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }
}