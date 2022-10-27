// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import '../../styles/styles.dart';
import '../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import '../../utils/validate.dart';
import 'profile.dart';

class SignUp extends StatefulWidget {
  String typeOfUser;

  SignUp({
    required this.typeOfUser,
    Key? key,
  }) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirm_password;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form != null) {
      form.validate();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CreateProfile(
          typeOfUser: widget.typeOfUser,
          email: email,
          password: password,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: context.resources.color.colorPrimary,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              height: 164,
              width: double.maxFinite,
              child: const Logo(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Center(
                        child: Material(
                          type: MaterialType.transparency,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Icon(Icons.arrow_back,
                                          size: 30)),
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
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Sign Up")),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      decoration: Styles.input.copyWith(
                                        labelText: 'Email Address',
                                      ),
                                      validator: (value) {
                                        email = value!.trim();
                                        return Validate.validateEmail(value);
                                      },
                                      initialValue: 'test@test.com',
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      obscureText: true,
                                      decoration: Styles.input.copyWith(
                                        labelText: 'Password',
                                      ),
                                      validator: (value) {
                                        password = value!.trim();
                                        return Validate.requiredField(
                                            value, 'Password is required.');
                                      },
                                      initialValue: 'password',
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      obscureText: true,
                                      decoration: Styles.input.copyWith(
                                        labelText: 'Confirm Password',
                                      ),
                                      validator: (value) {
                                        confirm_password = value!.trim();
                                        return Validate.confirmPassword(
                                            value, password);
                                      },
                                      initialValue: 'password',
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      softWrap: true,
                                      "By creating an account you agree to our Terms of Service and Privacy Policy",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 70),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Buttons(
                                        onTap: submit,
                                        text: "CONTINUE",
                                        color:
                                            context.resources.color.colorAccent,
                                        textColor: context
                                            .resources.color.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
