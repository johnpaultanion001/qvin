// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:untitled/feature/authentication/authenticate/authenticate.dart';
import 'package:untitled/res/AppContextExtension.dart';

class Permission extends StatefulWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'logo',
        child: Column(
          children: [
            SizedBox(height: 110),
            Container(
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/drawable/ic_qvin.png"),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    return Slider(
                      description: slides[index].getDescription(),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: () {
                  if (currentIndex == slides.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Authenticate()),
                    );
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: context.resources.color.colorWhite,
                      borderRadius: BorderRadius.circular(32)),
                  child: Center(
                    child: Text(slides[currentIndex].getTitle(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60)
          ],
        ),
      ),
      backgroundColor: context.resources.color.colorPrimary,
    );
  }

  /*void _getLocation() {
    _getLocationData().then((value) {
      LocationData? location = value;
      _getAddress(location?.latitude, location?.longitude).then((value) {
        setState(() {
          currentLocation = location;
          address = value;
        });
      });
    });
  }*/

}

class Slider extends StatelessWidget {
  String description;

  Slider({required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                softWrap: true,
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}

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

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel(title: '', description: '');

  sliderModel.setTitle("LET'S GO!");
  sliderModel.setDescription("Welcome!");
  slides.add(sliderModel);
  sliderModel = SliderModel(title: '', description: '');

  sliderModel.setTitle("ACTIVATE GPS");
  sliderModel.setDescription(
      "Let's activate your GPS first. It's how we make sure your forms are done the right way!");
  slides.add(sliderModel);
  sliderModel = SliderModel(title: '', description: '');

  sliderModel.setTitle("ACTIVATE NOTIFICATIONS");
  sliderModel.setDescription(
      "Now, let's turn on notifications so that you don't miss any repairs or forms and stay DOT ready!");
  slides.add(sliderModel);
  sliderModel = SliderModel(title: '', description: '');

  sliderModel.setTitle("ACTIVATE CAMERA");
  sliderModel.setDescription(
      "Finally, let's turn on the camera so you can scan the code!");
  slides.add(sliderModel);
  sliderModel = SliderModel(title: '', description: '');

  return slides;
}




Future<LocationData?> _getLocationData() async {
  Location location = new Location();
  LocationData _locationData;

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  _locationData = await location.getLocation();

  return _locationData;
}