import 'package:flutter/cupertino.dart';
import 'package:qvin/models/user_model.dart';
import '../db/database.dart';

class ProfileProvider extends ChangeNotifier {
  final SQLiteHelper _db = SQLiteHelper();

  List<UserModel> _users = [];

  //Load all data in database
  Future<void> loadUsers() async {
    final List<Map<String, dynamic>> data = await _db.user;

    _users = data.map((user) {
      return UserModel.fromJson(user);
    }).toList();
    notifyListeners();
  }

  List<UserModel> get user => [..._users];
}
