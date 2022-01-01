import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/controller/home_controller.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 16:26.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }

}