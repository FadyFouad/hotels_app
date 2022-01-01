import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotels_app/ui/screens/login_screen.dart';
import 'package:hotels_app/utils/pages.dart';
import 'package:logger/logger.dart';

import 'database/database_handler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.zoom,
      initialRoute: Pages.initial,
      getPages: Pages.routes,
    );
  }
}
