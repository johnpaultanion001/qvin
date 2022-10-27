// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../db/database.dart';
import '../models/user_model.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Splash,
}

class AuthProvider with ChangeNotifier {
  Status _status = Status.Splash;
  late String _token;
  final SQLiteHelper _db = SQLiteHelper();

  Status get status => _status;
  String get token => _token;

  final String api = 'http://192.168.0.33:8000/api/v1/auth';

  initAuthProvider() async {
    String? token = await getToken();
    if (token != null) {
      _token = token;
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    final url = 'https://staging.app.dot-ready.com/api/qvin/login';
    final data = {
      "email": email,
      "password": password,
    };

    final dio = Dio();
    Response response;
    response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      print(response.data['data']['user']);
      _status = Status.Authenticated;

      _token = response.data['data']['access_token'];
      await storeUserData(response.data['data']);
      await addOrUpdate(response.data['data']);

      print(response.statusCode);
      notifyListeners();
      print(_status);
      return true;
    }

    if (response.statusCode == 401) {
      _status = Status.Unauthenticated;
      print('Invalid email or password.');
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    print('Server error.');
    return false;
  }

  storeUserData(apiResponse) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('token', apiResponse['access_token']);
    await storage.setInt('id', apiResponse['user']['id']);
  }

  //create or update function
  addOrUpdate(apiResponse) async {
    await _db.insertNote(
      <String, dynamic>{
        'id': apiResponse['user']['id'],
        'first_name': apiResponse['user']['first_name'],
        'last_name': apiResponse['user']['last_name'],
        'email': apiResponse['user']['email'],
        'type': apiResponse['user']['type'],
      },
    );
    print('success inserted');
  }

  Future<String?> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? token = storage.getString('token');
    return token;
  }

  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    notifyListeners();
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}
