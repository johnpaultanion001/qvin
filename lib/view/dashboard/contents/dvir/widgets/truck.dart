import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';

class TruckWidget extends StatelessWidget {
  const TruckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final imgList = [
      'assets/drawable/truck1.png',
      'assets/drawable/truck2.png',
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Labels.md(
                text: 'TAP THE AREAS WHERE DAMAGE IS:',
                textColor: context.resources.color.textPrimary,
              ),
            ),
          ),
          Center(
              child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              pageSnapping: false,
            ),
            itemCount: imgList.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = imgList[index];
              return buildImage(urlImage, index);
            },
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Labels.md(
                text: 'SLIDE LEFT OR RIGHT TO SEE MORE',
                textColor: context.resources.color.textPrimary,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: context.resources.color.textPrimary,
                  size: 40,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: context.resources.color.textPrimary,
                  size: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(urlImage),
          ),
        ),
      );
}
