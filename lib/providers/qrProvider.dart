import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qvin/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/database.dart';
import '../dio/dio_helper.dart';

class QrProvider extends ChangeNotifier {
  late List _getTrailer = [];

  //Load all data in database
  getTrailerList() async {
    String? token = await getToken();
    Response response;
    try {
      response = await DioHelper.dio.get(
        'vehicles/trailers/index',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${token!}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);

        _getTrailer = response.data['data'];
        notifyListeners();
      }
    } on DioError catch (e) {
      notifyListeners();
    }
  }

  List get getTrailerLists => _getTrailer;
}

Future<String?> getToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? token = storage.getString('token');
  return token;
}
