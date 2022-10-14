import 'package:flutter/material.dart';

class MyModalBottomButton extends StatefulWidget {
  @override
  _MyModalBottomButtonState createState() => _MyModalBottomButtonState();
}

class _MyModalBottomButtonState extends State<MyModalBottomButton>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(microseconds: 1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*showModalBottomSheet<void>(
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Navigator(
          initialRoute: '/home': (context) => StickyPageWrapper(), //StickyPageWrapper.route().toString(),
          onGenerateRoute: (routeSettings) {
            final path = routeSettings.name;
            if (path == '/onboardingpage') {
              return MaterialPageRoute(
                settings: routeSettings,
                builder: (_) => OnboardingPage(),
              );
            }

            return MaterialPageRoute(
              settings: routeSettings,
              builder: (_) => OnboardingPage(),
            );
          },
        ),
      },
    ),*/

    /*return Navigator(
      initialRoute: _MyModalBottomButtonState().route().toString(),
      onGenerateRoute: (routeSettings) {
        final path = routeSettings.name;
        if (path == '/onboardingpage') {
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => OnboardingPage(),
          );
        }

        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OnboardingPage(),
        );
      },
    ),*/

    //3rd
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Center(
                              child: ElevatedButton(
                                child: Text('back'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text('Next Bottom'));
            });
      },
      child: Text('press Me'),

      //2nd
      /*return TextButton(
      child: Text("Show bottom sheet"),
      onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: GestureDetector(
                  onTap: (){
                    //Navigator.pushNamed(context, "label");
                    Navigator.pop(context);
                  },
                  child: Wrap(
                    children: [
                      ListTile(title: Text('Foo')),
                      ListTile(title: Text('Bar')),
                    ],
                  ),
                ),
              );
            },
          )*/

      //1st
/*showModalBottomSheet(
        context: context,
        transitionAnimationController: controller,
        builder: (context) {
          return Container(
            child: Text("Your bottom sheet",style: TextStyle(fontSize: 70),),
          );
        },
      ),*/
    );
  }
}
