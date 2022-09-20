import 'package:flutter/material.dart';
import 'dart:math';

class Setup extends StatefulWidget {
  final Widget child;

  const Setup(this.child);

  @override
  _SetupState createState() => _SetupState();
}

class MyCurve extends Curve {
  @override
  double transform(double t) => -pow(t, 2) + 1;
}

class _SetupState extends State<Setup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacityAnimation;
  int i = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    opacityAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: 0).animate(_controller),
        curve: Curves.easeInOutExpo);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      elevation: 16,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            child: FadeTransition(
              opacity: opacityAnimation,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      widget.child,
                      Container(
                        height: 10,
                      ),
                      RaisedButton(
                        child: Text("Next"),
                        onPressed: () {
                          _controller.forward().then((_) {
                            _controller.reverse();
                          });
                        },
                      )
                    ],
                  )),
            )),
      ),
      onClosing: () {},
    );
  }
}