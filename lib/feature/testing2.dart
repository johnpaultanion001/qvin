import 'package:flutter/material.dart';

class BS extends StatefulWidget {
  const BS({Key? key}) : super(key: key);

  @override
  _BS createState() => _BS();
}

class _BS extends State<BS> with SingleTickerProviderStateMixin {
  bool _showSecond = false;

  late AnimationController _controller;
  late Animation<double> opacityAnimation;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) => AnimatedContainer(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(30)),
        duration: const Duration(milliseconds: 400),
        child: AnimatedCrossFade(
            firstChild: Container(
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 200),
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => setState(() => _showSecond = true),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("Suivant"),
                    ],
                  ),
                ),
              ),
            ),
            secondChild: Container(
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height / 3),
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => setState(() => _showSecond = false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("ok"),
                    ],
                  ),
                ),
              ),
            ),
            crossFadeState: _showSecond
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 400)),
      ),
    );
  }
}
