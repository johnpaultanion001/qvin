// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import '../../providers/sliderProvider.dart';
import '../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import '../auth/authenticate.dart';

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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Authenticate()),
                    );
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
