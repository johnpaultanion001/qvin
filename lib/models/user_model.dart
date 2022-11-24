// ignore_for_file: non_constant_identifier_names, constant_identifier_names
const String tableUser = 'tbl_user';

class UserField {
  static final List<String> values = [
    id,
    name,
    email,
    type,
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String email = 'email';
  static const String type = 'type';
}

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? type;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.type,
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json[UserField.id] as int?,
        name: json[UserField.name] as String?,
        email: json[UserField.email] as String?,
        type: json[UserField.type] as String?,
      );
}
