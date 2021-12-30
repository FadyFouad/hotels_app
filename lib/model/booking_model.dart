/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:24.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/
class Booking {
  int id;
  String roomId;
  String guestId;
  String branchId;
  String fromDate;
  String toDate;

  Booking(
      {required this.id,
      required this.roomId,
      required this.guestId,
      required this.branchId,
      required this.fromDate,
      required this.toDate});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'roomId': this.roomId,
      'guestId': this.guestId,
      'branchId': this.branchId,
      'fromDate': this.fromDate,
      'toDate': this.toDate,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as int,
      roomId: map['roomId'] as String,
      guestId: map['guestId'] as String,
      branchId: map['branchId'] as String,
      fromDate: map['fromDate'] as String,
      toDate: map['toDate'] as String,
    );
  }
}

/**

    {
    "id":"id",
    "address":"address",
    "stars":5,
    "Room":{
    "id":1,
    "roomNumber":1,
    "numOfBeds":1,
    "view":"text",
    "level":"texr",
    "isForSmoking":false,
    "isEmpty":false,
    },
    "GuestModel":{
    "id":1  ,
    "branchId": "" ,
    "roomId":  "",
    "name":  "",
    "email":  "",
    "phone":  "",
    "address":  "",
    },
    "EmployeeModel":{
    "id": 1,
    "name": "",
    "phone": "",
    "branchId": "",
    "privileges": "",
    },
    "Booking":[
    {
    "id":1,
    "roomId":"",
    "guestId":"",
    "branchId":"",
    "fromDate":"",
    "toDate":"",
    }
    ]
    }

 **/
