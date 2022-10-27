// ignore_for_file: non_constant_identifier_names, constant_identifier_names
const String tableUser = 'tbl_user';

class UserField {
  static final List<String> values = [
    id,
    first_name,
    last_name,
    email,
    type,
  ];

  static const String id = 'id';
  static const String first_name = 'first_name';
  static const String last_name = 'last_name';
  static const String email = 'email';
  static const String type = 'type';
}

class UserModel {
  final int? id;
  final String first_name;
  final String last_name;
  final String email;
  final String type;

  const UserModel({
    this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.type,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json[UserField.id] as int?,
        first_name: json[UserField.first_name] as String,
        last_name: json[UserField.last_name] as String,
        email: json[UserField.email] as String,
        type: json[UserField.type] as String,
      );
}
