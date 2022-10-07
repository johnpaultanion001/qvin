// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';
import 'profile.dart';

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
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 600,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: const Icon(Icons.arrow_back, size: 30)),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                          alignment: Alignment.topLeft, child: Text("Sign Up")),
                      const SizedBox(height: 30),
                      const TextField(
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
                      const SizedBox(height: 10),
                      const TextField(
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
                      const SizedBox(height: 10),
                      const TextField(
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
                      const SizedBox(height: 20),
                      const Text(
                        softWrap: true,
                        "By creating an account you agree to our Terms of Service and Privacy Policy",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: const Center(
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
