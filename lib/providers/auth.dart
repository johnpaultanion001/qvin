// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/database.dart';
import '../dio/dio_helper.dart';
import '../utils/notification_text.dart';

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
  late int? _statusResponse;
  final SQLiteHelper _db = SQLiteHelper();
  NotificationText _notification = const NotificationText('');

  Status get status => _status;
  String get token => _token;
  int? get statusResponse => _statusResponse;
  NotificationText get notification => _notification;

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

  authReady() async {
    _status = Status.Unauthenticated;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _status = Status.Authenticating;
    notifyListeners();
    final data = {
      "email": email,
      "password": password,
    };

    Response response;
    try {
      response = await DioHelper.dio.post('login', data: data);
      if (response.statusCode == 200) {
        print(response.data['data']['user']);
        _notification = const NotificationText(
          'Successfully signed in.',
          type: 'info',
        );
        _status = Status.Authenticated;
        _token = response.data['data']['access_token'];
        await storeUserData(response.data['data']);
        await addOrUpdate(response.data['data']);
        print(response.statusCode);
        notifyListeners();
        print(_status);
        return true;
      }
    } on DioError catch (e) {
      print(e.response!.statusCode);
      _notification = const NotificationText(
        'Wrong email or password',
      );
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    _notification = const NotificationText(
      'Server Error',
    );
    notifyListeners();
    print('Server error.');
    return false;
  }

  Future<bool> signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String typeOfUser,
  ) async {
    final data = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "type": typeOfUser,
    };

    Response response;
    try {
      response = await DioHelper.dio.post('signup', data: data);

      if (response.statusCode == 200) {
        print(response.data['data']);
        print(response.statusCode);
        _status = Status.Unauthenticated;
        _notification = const NotificationText(
          'Sign in your newly created account',
          type: 'info',
        );
        _statusResponse = response.statusCode;
        notifyListeners();
        return true;
      }
    } on DioError catch (e) {
      _notification = const NotificationText(
        'The email has already been taken.',
      );
      _status = Status.Unauthenticated;
      _statusResponse = e.response?.statusCode;
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    _notification = const NotificationText(
      'Server Error',
    );
    notifyListeners();
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
    _notification = const NotificationText(
      '',
    );
    notifyListeners();
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}
