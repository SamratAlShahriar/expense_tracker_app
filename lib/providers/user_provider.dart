import 'package:flutter/material.dart';
import '../database/sqflite/db_helper.dart';

import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  late UserModel userModel;
  Future<UserModel?> getUserByEmail(String email) =>
      DbHelper.getUserByEmail(email);

  Future<int> insertUser(UserModel userModel) =>
      DbHelper.insertUser(userModel);

  Future<void> getUserById(int id) async {
    userModel = await DbHelper.getUserById(id);
  }

}