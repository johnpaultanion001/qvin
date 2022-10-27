// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/auth.dart';
import 'package:untitled/providers/profileProvider.dart';
import 'package:untitled/utils/loading.dart';
import 'package:untitled/view/auth/authenticate.dart';
import 'package:untitled/view/auth/login.dart';
import 'package:untitled/view/auth/typeOfUser.dart';
import 'package:untitled/view/dashboard/dashboard.dart';
import 'package:untitled/view/splash/splash.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'db/database.dart';
import 'providers/informationProvider.dart';
import 'providers/sliderProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLite.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Qvin';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => AuthProvider()),
        ChangeNotifierProvider(create: (create) => SliderProvider()),
        ChangeNotifierProvider(create: (create) => InfomationProvider()),
        ChangeNotifierProvider(create: (create) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: context.resources.color.colorPrimary,
          accentColor: context.resources.color.colorPrimary,
          scaffoldBackgroundColor: context.resources.color.colorWhite,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Auth(),
          '/splash': (context) => const Splash(),
          '/loading': (context) => const LoadingPage(),
          '/login': (context) => Login(),
          '/register': (context) => TypeOfUser(),
          '/dashboard': (context) => Dashboard(),
        },
      ),
    );
  }
}

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        print(user.status);
        switch (user.status) {
          case Status.Uninitialized:
            return LoadingPage();
          case Status.Unauthenticated:
            return Authenticate();
          case Status.Authenticated:
            return Dashboard();
          default:
            return Splash();
        }
      },
    );
  }

  Future<void> dashboard() async {
    return print('test');
  }
}
