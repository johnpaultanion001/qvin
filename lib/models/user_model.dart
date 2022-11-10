// ignore_for_file: non_constant_identifier_names, constant_identifier_names
const String tableUser = 'tbl_user';

class UserField {
  static final List<String> values = [
    id,
    display_name,
    email,
    type,
  ];

  static const String id = 'id';
  static const String display_name = 'display_name';
  static const String email = 'email';
  static const String type = 'type';
}

class UserModel {
  final int? id;
  final String display_name;
  final String email;
  final String type;

  const UserModel({
    this.id,
    required this.display_name,
    required this.email,
    required this.type,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json[UserField.id] as int?,
        display_name: json[UserField.display_name] as String,
        email: json[UserField.email] as String,
        type: json[UserField.type] as String,
      );
}
