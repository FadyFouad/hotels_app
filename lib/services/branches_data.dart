import 'package:flutter/material.dart';
import 'package:hotels_app/database/database_handler.dart';
import 'package:hotels_app/model/branch_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 01-Jan-22 at 17:45.      ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class BranchesData{
  Future<BranchModel>getBranchById(int id)async{
    List<BranchModel> branches = await DatabaseHandler().retrieveBranches();
    return branches.firstWhere((branch) => branch.id == id);
  }
}
