import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:hotels_app/utils/routes.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 19:48.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/
class ProfileController extends GetxController{

  var guest = GuestModel().obs;
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController phone =TextEditingController();

  @override
  void onInit() {
    getGuest();
  }

  @override
  void onClose() {

  }

  getGuest()async{
    List<GuestModel> list = await DatabaseHandler().retrieveGuests();
    guest.value = list.first;
    print(guest.value.name);

    name.text = guest.value.name!;
    phone.text = guest.value.phone!;
    email.text = guest.value.email!;
    update();
  }


  @override
  void onReady() {

  }

  updateGuest()async{
    await DatabaseHandler().updateGuest(1, {
      'name':name.text,
      'email':email.text,
      'phone':phone.text,
    });
    update();
    Get.offAllNamed(Routes.home);
  }
}
