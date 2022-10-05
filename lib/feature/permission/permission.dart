// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/feature/authentication/authenticate/authenticate.dart';
import 'package:untitled/feature/permission/provider/sliderProvider.dart';
import 'package:untitled/res/AppContextExtension.dart';
import 'widgets/slider.dart';

class Permission extends StatefulWidget {
  const Permission({Key? key}) : super(key: key);
  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context);
    final slides = provider.slides;

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
                image: DecorationImage(
                  image: AssetImage(context.resources.label.logo),
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
                    return SliderDesc(
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
                            color: context.resources.color.colorPrimary,
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
}

// Future<LocationData?> _getLocationData() async {
//   Location location = new Location();
//   LocationData _locationData;

//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;

//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return null;
//     }
//   }

//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return null;
//     }
//   }

//   _locationData = await location.getLocation();

//   return _locationData;
// }
