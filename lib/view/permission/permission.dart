// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import '../../providers/sliderProvider.dart';
import '../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import '../auth/authenticate.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);
  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  Future<void> PermissionCamera() async {
    print('permession camera');
    await Permission.camera.request();
  }

  Future<void> PermissionGPS() async {
    print('permession gps');
    await Permission.location.request();
  }

  Future<void> PermissionNotif() async {
    print('permession notif');
    await Permission.notification.request();
  }

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
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: const Logo(),
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Labels.md(
                                text: slides[index].getDescription(),
                                textColor:
                                    context.resources.color.textSecondary,
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              Buttons(
                onTap: () {
                  if (currentIndex == slides.length - 1) {
                    PermissionCamera();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Authenticate()),
                    );
                  }
                  if (currentIndex == 1) {
                    PermissionGPS();
                  }
                  if (currentIndex == 2) {
                    PermissionNotif();
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInSine,
                  );
                },
                text: slides[currentIndex].getTitle(),
                color: context.resources.color.colorWhite,
                textColor: context.resources.color.textPrimary,
              ),
              SizedBox(height: 60)
            ],
          ),
        ),
      ),
      backgroundColor: context.resources.color.colorPrimary,
    );
  }
}
