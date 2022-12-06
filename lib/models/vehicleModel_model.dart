// ignore_for_file: non_constant_identifier_names, constant_identifier_names
class ModelField {
  static final List<String> values = [
    name,
  ];

  static const String name = 'name';
}

class VehicleModel {
  final String? name;

  const VehicleModel({
    this.name,
  });

  static VehicleModel fromJson(Map<String, Object?> json) => VehicleModel(
        name: json[ModelField.name] as String?,
      );
}
