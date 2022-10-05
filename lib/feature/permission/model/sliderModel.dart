// ignore_for_file: file_names
class SliderModel {
  String title;
  String description;

  SliderModel({required this.title, required this.description});

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}
