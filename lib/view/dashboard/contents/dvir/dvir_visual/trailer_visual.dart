import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir_visual/select_problem.dart';

class TrailerVisual extends StatelessWidget {
  const TrailerVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final imgList = [
      'assets/drawable/truck3.png',
      'assets/drawable/truck4.png',
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
              return buildImage(urlImage, index, context);
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

  Widget buildImage(String urlImage, int index, BuildContext context) =>
      GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => SelectProblem(),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(urlImage),
            ),
          ),
        ),
      );
}
