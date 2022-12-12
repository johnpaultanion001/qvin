// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import 'package:qvin/view/auth/profile.dart';
import '../../styles/styles.dart';
import '../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import '../../utils/loading_screen.dart';
import '../../utils/validate.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';

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
  late String confirmPassword;
  bool isLoading = false;

  Future<void> submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      await authProvider.signup(
        email,
        password,
        widget.typeOfUser,
      );
      if (authProvider.statusResponse == 200) {
        print('profile');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CreateProfile(
              typeOfUser: widget.typeOfUser,
              email: email,
            ),
          ),
        );
      }
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const LoadingScreen()
            : Container(
                decoration: BoxDecoration(
                  color: context.resources.color.colorPrimary,
                ),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 164,
                      width: double.maxFinite,
                      child: Logo(),
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
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Material(
                              type: MaterialType.transparency,
                              child: SingleChildScrollView(
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
                                            child: Labels.sm(
                                              text:
                                                  "Please enter your email address and password. If you are using DOTReady, you can log in on the previous screen.",
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Consumer<AuthProvider>(
                                            builder: (context, user, child) {
                                              return user.notification;
                                            },
                                          ),
                                          const SizedBox(height: 30),
                                          TextFormField(
                                            decoration: Styles.input.copyWith(
                                              labelText: 'Email Address',
                                            ),
                                            validator: (value) {
                                              email = value!.trim();
                                              return Validate.validateEmail(
                                                  value);
                                            },
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
                                                  value,
                                                  'Password is required.');
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                          TextFormField(
                                            obscureText: true,
                                            decoration: Styles.input.copyWith(
                                              labelText: 'Confirm Password',
                                            ),
                                            validator: (value) {
                                              confirmPassword = value!.trim();
                                              return Validate.confirmPassword(
                                                  value, password);
                                            },
                                          ),
                                          const SizedBox(height: 20),
                                          const Labels.sm(
                                            text:
                                                "By creating an account you agree to our Terms of Service and Privacy Policy",
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Buttons(
                                              onTap: submit,
                                              text: "SIGN UP",
                                              color: context
                                                  .resources.color.colorAccent,
                                              textColor: context.resources.color
                                                  .textSecondary,
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
                  ],
                ),
              ),
      ),
    );
  }
}
