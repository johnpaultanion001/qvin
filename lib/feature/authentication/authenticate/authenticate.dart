// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

import '../../dashboard/dashboard.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  void _showLogin() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => Login(),
      ),
    );
  }

  void _showSignUp() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => TypeOfUser(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: SafeArea(
        child: (Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: size.height * 0.25,
                  width: size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/drawable/ic_qvin.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: _showSignUp,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: context.resources.color.colorAccent,
                        borderRadius: BorderRadius.circular(32)),
                    child: Center(
                      child: Text('SIGNUP',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: _showLogin,
                  /*async {
                    final backButton =
                    await Navigator.of(context).push<bool?>(
                      PageRouteBuilder(
                        opaque: false,
                        barrierDismissible: true,
                        pageBuilder: (_, __, ___) => const Login(),
                      ),
                    );
                    if (backButton == null || backButton == false) {
                      if (mounted) Navigator.of(context).pop();
                    }
                  },*/
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: context.resources.color.colorWhite,
                        borderRadius: BorderRadius.circular(32)),
                    child: Center(
                      child: Text('LOGIN',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        )),
      ),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _resetPasswordLink() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => ResetPasswordLink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 500,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Lets get started")),
                      SizedBox(height: 60),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Email address'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Password'),
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: /*_resetPasswordLink*/ () async {
                            final backButton =
                                await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) =>
                                    ResetPasswordLink(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Forgot Password?"),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          onTap:  () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard()),
                            );
                          },
                          /*() async {
                            final backButton =
                            await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) =>
                                    Dashboard(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          },*/
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResetPasswordLink extends StatefulWidget {
  ResetPasswordLink({Key? key}) : super(key: key);

  @override
  State<ResetPasswordLink> createState() => _ResetPasswordLinkState();
}

class _ResetPasswordLinkState extends State<ResetPasswordLink> {
  void _resetPassword() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => ResetPassword(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 500,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: Icon(Icons.arrow_back, size: 30)),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Reset Password",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Reset Password")),
                      SizedBox(height: 60),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Email address'),
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          /*onTap: _resetPassword,*/
                          onTap: () async {
                            final backButton =
                                await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) => ResetPassword(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('SEND LINK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 550,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: Icon(Icons.arrow_back, size: 30)),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Reset Password",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Reset Password")),
                      SizedBox(height: 60),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'New password'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Confirm password'),
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('CONFIRM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TypeOfUser extends StatefulWidget {
  TypeOfUser({Key? key}) : super(key: key);

  @override
  State<TypeOfUser> createState() => _TypeOfUserState();
}

class _TypeOfUserState extends State<TypeOfUser> {
  // 2nd solution
  int? _selectedValueIndex;
  List<String> buttonText = [
    "ORG ADMIN",
    "LOCATION MANAGER",
    "DRIVER",
    "MECHANIC",
    "POLICE OFFICER"
  ];

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.75),
              color: index == _selectedValueIndex ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(32)),
          child: Center(
            child: Text(text,
                style: TextStyle(
                    color: index == _selectedValueIndex
                        ? Colors.white
                        : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
        ),
      ),
    );
  }
  // 2nd solution

  List<ButtonProperties> buttonsList = [
    ButtonProperties(label: 'Button 1'),
    ButtonProperties(label: 'Button 2'),
    ButtonProperties(label: 'Button 3'),
    ButtonProperties(label: 'Button 4'),
    ButtonProperties(label: 'Button 5'),
    ButtonProperties(label: 'Button 6'),
    ButtonProperties(label: 'Button 7'),
    ButtonProperties(label: 'Button 8'),
    ButtonProperties(label: 'Button 9'),
  ];

  void _onChangeButtonColor(int index) {
    setState(() {
      if (buttonsList[index].selected) {
        buttonsList[index].selected = false;
        buttonsList[index].color = Colors.black;
      } else {
        buttonsList[index].selected = true;
        buttonsList[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 600,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Type of user",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ),
                      SizedBox(height: 25),
                      ...List.generate(
                        buttonText.length,
                        (index) => button(
                          index: index,
                          text: buttonText[index],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          onTap: () async {
                            final backButton =
                                await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) => SignUp(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('CONTINUE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonProperties {
  String label;
  Color color;
  bool selected;

  ButtonProperties(
      {required this.label, this.color = Colors.black, this.selected = false});
}

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 600,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: Icon(Icons.arrow_back, size: 30)),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.topLeft, child: Text("Sign Up")),
                      SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Email address'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Email address'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Email address'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        softWrap: true,
                        "By creating an account you agree to our Terms of Service and Privacy Policy",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 70),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          onTap: () async {
                            final backButton =
                                await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) => CreateProfile(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CreateProfile extends StatefulWidget {
  CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String dropdownValue = 'One';
  List<String> location = ['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 600,
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: Icon(Icons.arrow_back, size: 30)),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Create Profile",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Create Profile")),
                      SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Driver Name'),
                      ),
                      SizedBox(height: 10),
                      InputDecorator(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Select a vehicle '),
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            isDense: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'DOT #'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            /*prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),*/
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(fontFamily: "WorkSansLight"),
                            filled: true,
                            fillColor: Colors.black12,
                            hintText: 'Phone #'),
                      ),
                      SizedBox(height: 90),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          /*onTap: _resetPassword,*/
                          onTap:
                              () {} /*async {
                            final backButton =
                            await Navigator.of(context).push<bool?>(
                              PageRouteBuilder(
                                opaque: false,
                                barrierDismissible: true,
                                pageBuilder: (_, __, ___) => ResetPassword(),
                              ),
                            );
                            if (backButton == null || backButton == false) {
                              if (mounted) Navigator.of(context).pop();
                            }
                          }*/
                          ,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text('CONTINUE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
