import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'database/database_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final log = Logger();

  getBranches()async{
    var branches = await DatabaseHandler().retrieveGuests();
    log.i(branches.map((e)=>e.toMap()).toList());
  }

  @override
  Widget build(BuildContext context) {
    getBranches();
    // DatabaseHandler().addDummyData();
    return const Scaffold(
      backgroundColor: Color(0xff2446a6),
      body: SafeArea(
        child: Text(''),
      ),
    );
  }
}
