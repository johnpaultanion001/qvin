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
  Status _status = Status.Uninitialized;

  late String _token;
  late int? _statusResponse;
  final SQLiteHelper _db = SQLiteHelper();
  NotificationText _notification = const NotificationText('');
  late bool _isProfile = true;
  late String _typeOfUser;

  Status get status => _status;
  String get token => _token;
  String get typeOfUser => _typeOfUser;
  int? get statusResponse => _statusResponse;
  bool get isProfile => _isProfile;
  NotificationText get notification => _notification;

  initAuthProvider() async {
    String? token = await getToken();
    if (token == null) {
      _status = Status.Splash;
    } else if (token == 'LOGOUT') {
      _status = Status.Unauthenticated;
    } else {
      _token = token;
      _status = Status.Authenticated;
    }
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
        if (response.data['data']['qvin_profile']['name'] != '') {
          _notification = const NotificationText(
            'Successfully signed in.',
            type: 'info',
          );
          _status = Status.Authenticated;
          _token = response.data['data']['access_token'];
          _isProfile = true;
          await storeUserData(response.data['data']);
          await addOrUpdate(response.data['data']);
        } else {
          _status = Status.Unauthenticated;
          _isProfile = false;
          _notification = const NotificationText(
            'Complete your profile information',
          );
          _typeOfUser = response.data['data']['user']['type'];
        }

        notifyListeners();
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
    String email,
    String password,
    String typeOfUser,
  ) async {
    final data = {
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
        _statusResponse = response.statusCode;
        _notification = const NotificationText(
          '',
        );
        notifyListeners();
        return true;
      }
    } on DioError catch (e) {
      _statusResponse = e.response?.statusCode;

      if (_statusResponse == 400) {
        _notification = const NotificationText(
          'The email has already been taken.',
        );
      }
      if (_statusResponse == 500) {
        _notification = const NotificationText(
          'Server Error',
        );
      }
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    notifyListeners();
    return false;
  }

  Future<bool> profile(
    String email,
    String name,
    String vehicleMake,
    String vehicleModel,
    String vehicleYear,
    String dotNumber,
    String phoneNumber,
    String driverType,
  ) async {
    final data = {
      "email": email,
      "name": name,
      "vehicle_make": vehicleMake,
      "vehicle_model": vehicleModel,
      "vehicle_year": vehicleYear,
      "dot_number": dotNumber,
      "phone_number": phoneNumber,
      "driver_type": driverType,
    };

    Response response;
    try {
      response = await DioHelper.dio.post(
        'profile/store',
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWNkNmFhOGMxMzQ1NDVlMmJmMDZmYTEwNjQ0MTU1OGYwMTlmNzZjMjIxMmQxYjY2NDg3ODVkN2JjY2EwY2ZjMGZhOWYyYzdhNTdjZTIyNGMiLCJpYXQiOjE2Njc5NjUwNjYuOTcxNDI1LCJuYmYiOjE2Njc5NjUwNjYuOTcxNDMsImV4cCI6MTY5OTUwMTA2Ni45NjQ4ODQsInN1YiI6IjE1MSIsInNjb3BlcyI6W119.E9iNYn_tM3km_KR4kVf8LvIyfyu2dj9rRuXK9AitZvSdi-_Qmr9WRs3HzPkCuvNuwTpX1u04GT0ItN3PqajJMbs03FtNRnLxeQdXVXyurt1nKpD6H8if3j_P0BNko2GYDQ1et3bKe_207GXAOJ2lUfMUmjOWD3cxK7SjO2KZGm3kcDJK9znlk1qrqDvuQkXPdElP2zfMIEtMA2GcKjYChkGGwxBy4D_2YqDuNQ8OZqSB-Jk8j0oj9VND3FtWwhmck6rZKwTHb2nCC0vlG0FQD2O_RQyQfO_qNwUXwtMecMwitiMX_zeuhAXUTRCYVaFw8pR_sPF_RHpzcS41mYndAxBJm6wpk-icW9LhavFqKhvG6lEIV0kZ4MRWR7kkiJs18n1nvnE_zjcmxdaCvJVfgfJp78u7KAYVoqk0xa3RLAyJJWOLM-z77mZIzZZIsutWHCLtALSM9II9FqINgS_gE6bPnTiRAXTqS1NPsKpwttvFpiYHc1BENiiXc5PBIe3GUvgWdgPkRfi4PfKnZBaKRPiYOkA6YtC8hzbIogXDytWz88I4T28nkk-1xfWS72yMRbBGPKugrTBwmYC7T0A__5oTKIoUevMjn0S3AlxBkKAIE5chWs71dpBP9T1ZFEb2f93PEmrkbyhp0XRMHGZXS8xErvCGDCc_OQaL7J9y2S8",
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data['data']);
        print(response.statusCode);
        _status = Status.Unauthenticated;
        _statusResponse = response.statusCode;
        _notification = const NotificationText(
          'Login your newly created account',
          type: 'info',
        );
        notifyListeners();
        return true;
      }
    } on DioError catch (e) {
      _statusResponse = e.response?.statusCode;
      print(_statusResponse);
      if (_statusResponse == 400) {
        _notification = const NotificationText(
          'The email has already been taken.',
        );
      }
      if (_statusResponse == 500) {
        _notification = const NotificationText(
          'Server Error',
        );
      }
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    notifyListeners();
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
        '_id': apiResponse['user']['id'],
        'name': apiResponse['qvin_profile']['name'],
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

  setTokenToLogout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('token', 'LOGOUT');
  }

  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    _notification = const NotificationText(
      '',
    );
    notifyListeners();
    setTokenToLogout();
    notifyListeners();
  }
}
