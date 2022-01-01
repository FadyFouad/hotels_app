import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/booking_model.dart';
import 'package:hotels_app/model/branch_model.dart';
import 'package:hotels_app/model/guest_model.dart';
import 'package:hotels_app/services/branches_data.dart';
import 'package:logger/logger.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 16:25.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class HomeController extends GetxController {
  Logger log = Logger();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController roomIdController = TextEditingController();
  var guests = [].obs;
  var rooms = [].obs;
  var bookings = List<Booking>.empty(growable: true).obs;
  var branches = [].obs;
  var employees = [].obs;
  var guest = GuestModel().obs;
  var branch = BranchModel().obs;
  RxInt branchId = 1.obs;

  @override
  void onInit() {
    getGuest();
    getBookings();
  }

  @override
  void onClose() {}

  @override
  void onReady() async {
    getBranches();
    guest.value = await getGuest();
    log.i(branches);
    update();
  }

  getGuest() async {
    guests.value = await DatabaseHandler().retrieveGuests();
    guest.value = guests.value.first;
    update();
  }

  getEmployee() async {
    employees.value = await DatabaseHandler().retrieveEmployees();
    update();
  }

  getBranches() async {
    branches.value = await DatabaseHandler().retrieveBranches();
  }

  getRooms() async {
    rooms.value = await DatabaseHandler().retrieveRooms();
  }

  getBookings() async {
    bookings.value = await DatabaseHandler().retrieveBookings();
    update();
  }

  getBranch(int id) async {
    var branchModel = await BranchesData().getBranchById(id);
    branch.value = branchModel;
    update();
  }

  addBookingToSqflite() async {
    List<Booking> bookings = [];
    var bookRoom = Booking(
        fromDate: fromDateController.text,
        toDate: toDateController.text,
        guestId: 1,
        roomId: int.parse(roomIdController.text),
        branchId: 1);
    bookings.add(bookRoom);
    await DatabaseHandler().insertBooks(bookings);
    fromDateController.text='';
    toDateController.text='';
    roomIdController.text='';
    update();
    Get.snackbar('Congratulations', 'Your Room Reserved');
    Get.back();
  }
}
