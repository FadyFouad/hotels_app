import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/controller/home_controller.dart';
import 'package:hotels_app/model/booking_model.dart';
import 'package:hotels_app/ui/screens/login_screen.dart';
import 'package:hotels_app/ui/widgets/mybottomnavbar.dart';
import 'package:hotels_app/utils/colours.dart';
import 'package:hotels_app/utils/constants.dart';
import 'package:hotels_app/utils/routes.dart';
import 'package:intl/intl.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 15:56.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2446a6),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: MyColors.lightBlue,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: MyColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 70,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      "Guest Profile",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4!
                          .apply(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap:(){
                        Get.toNamed(Routes.profile);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10.0),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        kProfilePic,
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Obx(() =>
                                        Text(
                                          "${controller.guest.value.name ?? 'No Guests'}",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .subtitle2!
                                              .apply(
                                              color: MyColors.darkBlue,
                                              fontWeightDelta: 2),
                                        ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        color: MyColors.darkBlue,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                padding: const EdgeInsets.all(25.0),
                                color: MyColors.lightBlue,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "My next trip",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .subtitle2!
                                            .apply(color: Colors.white),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "05 ",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .subtitle2!
                                          .apply(color: Colors.white),
                                    ),
                                    Text(
                                      "Jan 2022",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText2!
                                          .apply(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "My Bookings",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline5!
                          .apply(color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    Obx(() =>
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.bookings.length + 1,
                            itemBuilder: (ctx, i) {
                              return i == controller.bookings.length
                                  ? Container(
                                width: 150,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 11.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: "Book A Room",
                                        backgroundColor: MyColors.lightBlue,
                                        titleStyle: const TextStyle(
                                            color: Colors.white),
                                        middleTextStyle: const TextStyle(
                                            color: Colors.white),
                                        textConfirm: "Confirm",
                                        onConfirm: ()async{
                                          await controller.addBookingToSqflite();
                                         },
                                        textCancel: "Cancel",
                                        cancelTextColor: Colors.white,
                                        confirmTextColor: Colors.white,
                                        buttonColor: Colors.red,
                                        radius: 30,
                                        content: Column(
                                          children: [
                                          InkWell(
                                            onTap:()async{
                                              DateFormat formatter = DateFormat('dd/MM/yyyy');
                                              final DateTime? picked = await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1901, 1),
                                                  lastDate: DateTime(2100));
                                              if (picked != null)
                                                  controller.toDateController.text =  formatter.format(picked);//Use formatter to format selected date and assign to text field

                                      },
                                            child: TextField(
                                            controller:controller.
                                            toDateController,
                                            enabled: false,
                                            decoration: const InputDecoration(
                                                hintText: 'from'
                                            ),
                                        ),
                                          ),
                                        InkWell(
                                          onTap:() async{
                                      DateFormat formatter = DateFormat('dd/MM/yyyy');
                                      final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1901, 1),
                                      lastDate: DateTime(2100));
                                      if (picked != null)
                                      controller.fromDateController.text =  formatter.format(picked);//Use formatter to format selected date and assign to text field

                                      },
                                          child: TextField(
                                            controller: controller
                                                .fromDateController,
                                            enabled: false,
                                            decoration: const InputDecoration(
                                                hintText: 'to'
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: controller
                                              .roomIdController,
                                      keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              hintText: ''
                                          ),
                                        ),
                                          ],
                                      ));
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        const Positioned.fill(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 9.0, vertical: 5.0),
                                            decoration: const BoxDecoration(
                                              color: MyColors.lightBlue,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Text("ADD ROOM",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  : GestureDetector(
                                onTap: () =>
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => const LoginScreen(),
                                      ),
                                    ),
                                child: Container(
                                  width: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 11.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Image.network(
                                            kRoomPic,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 9.0,
                                                vertical: 5.0),
                                            decoration: const BoxDecoration(
                                              color: MyColors.lightBlue,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "to ${controller.bookings[i]
                                                      .fromDate}",
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .apply(
                                                      color:
                                                      Colors.white),
                                                ),
                                                Text(
                                                  "from ${controller.bookings[i]
                                                      .toDate}",
                                                  style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .apply(
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              height: 70,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(11.0),
                child: MyBottomNavBar(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
