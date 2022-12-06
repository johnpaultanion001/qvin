import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qvin/models/user_model.dart';
import '../db/database.dart';
import '../dio/dio_helper.dart';
import '../models/vehicleModel_model.dart';

class ProfileProvider extends ChangeNotifier {
  final SQLiteHelper _db = SQLiteHelper();

  List<UserModel> _users = [];
  late List _getModels = [];
  late List _getMakes = [];

  //Load all data in database
  Future<void> loadUsers() async {
    final List<Map<String, dynamic>> data = await _db.user;

    _users = data.map((user) {
      return UserModel.fromJson(user);
    }).toList();
    notifyListeners();
  }

  List<UserModel> get user => [..._users];

  getModelList() async {
    Response response;
    try {
      response = await DioHelper.dio.get(
        'vehicles/models',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      print(response.statusCode);
      _getModels = response.data['data'];
      notifyListeners();
    } on DioError catch (e) {}
    notifyListeners();
  }

  List get getModelLists => _getModels;

  getMakeList() async {
    Response response;
    try {
      response = await DioHelper.dio.get(
        'vehicles/makes',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);

        _getMakes = response.data['data'];
        notifyListeners();
      }
    } on DioError catch (e) {
      notifyListeners();
    }
  }

  List get getMakeLists => _getMakes;
}
