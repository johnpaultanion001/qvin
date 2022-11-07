// ignore_for_file: file_names, prefer_final_fields
import 'package:flutter/cupertino.dart';
import '../../../models/sliderModel.dart';

class SliderProvider extends ChangeNotifier {
  List<SliderModel> _sliders = [
    SliderModel(
      title: "LET'S GO!",
      description:
          'Welcome to QVIN, To get started , we need to activate some things like GPS, Notifications, and Camera access.',
    ),
    SliderModel(
      title: "ACTIVATE GPS",
      description:
          "Let's activate your GPS first. It's how we make sure your forms are done the right way!",
    ),
    SliderModel(
      title: "ACTIVATE NOTIFICATIONS",
      description:
          "Now, let's turn on notifications so that you don't miss any repairs or forms and stay DOT ready!",
    ),
    SliderModel(
      title: "ACTIVATE CAMERA",
      description:
          "Finally, let's turn on the camera so you can scan the code!",
    ),
  ];

  List<SliderModel> get slides => _sliders.toList();
}
