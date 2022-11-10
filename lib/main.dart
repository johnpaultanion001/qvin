// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/providers/auth.dart';
import 'package:qvin/providers/profileProvider.dart';
import 'package:qvin/utils/loading.dart';
import 'package:qvin/utils/loading_screen.dart';
import 'package:qvin/view/auth/authenticate.dart';
import 'package:qvin/view/auth/login.dart';
import 'package:qvin/view/auth/password/resetPassword.dart';
import 'package:qvin/view/auth/password/resetPasswordLink.dart';
import 'package:qvin/view/auth/typeOfUser.dart';
import 'package:qvin/view/dashboard/dashboard.dart';
import 'package:qvin/view/splash/splash.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'db/database.dart';
import 'dio/dio_helper.dart';
import 'providers/informationProvider.dart';
import 'providers/sliderProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
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
          '/auth': (context) => Authenticate(),
          '/login': (context) => Login(),
          '/reset_password_link': (context) => ResetPasswordLink(),
          '/reset_password': (context) => ResetPassword(),
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
          case Status.Splash:
            return Splash();
          case Status.Uninitialized:
            return LoadingPage();
          case Status.Unauthenticated:
            return Login();
          case Status.Authenticated:
            return Dashboard();
          default:
            return LoadingScreen();
        }
      },
    );
  }
}
