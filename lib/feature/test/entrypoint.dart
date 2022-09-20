import 'package:flutter/material.dart';

class StickyPageWrapper extends StatelessWidget {
  final Widget child;
  const StickyPageWrapper({required Key key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Positioned(
          left: 0,
          bottom: 0,
          child: Hero(
            tag: 'bottom_sheet',
            child: Container(
              color: Colors.orange,
              height: size.height / 4,
              width: size.width,
            ),
          ),
        )
      ],
    );
  }
}
