/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 30-Dec-21 at 23:24.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/
class Booking {
  int ?id;
  int? roomId;
  int? guestId;
  int? branchId;
  String? fromDate;
  String? toDate;

  Booking(
      { this.id,
       this.roomId,
       this.guestId,
       this.branchId,
       this.fromDate,
       this.toDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roomId': roomId,
      'guestId': guestId,
      'branchId': branchId,
      'fromDate': fromDate,
      'toDate': toDate,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as int,
      roomId: map['roomId'] as int,
      guestId: map['guestId'] as int,
      branchId: map['branchId'] as int,
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
