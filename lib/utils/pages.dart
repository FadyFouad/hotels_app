import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/binding/home_binding.dart';
import 'package:hotels_app/binding/profile_binding.dart';
import 'package:hotels_app/ui/screens/home_screen.dart';
import 'package:hotels_app/ui/screens/login_screen.dart';
import 'package:hotels_app/ui/screens/profile_screen.dart';
import 'package:hotels_app/utils/routes.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 15:49.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class Pages {
  static const initial = Routes.root;

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding:HomeBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),

  ];
}

