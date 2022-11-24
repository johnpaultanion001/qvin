// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import 'package:qvin/utils/loading_screen.dart';
import 'package:qvin/view/auth/profile.dart';
import '../../../styles/styles.dart';
import '../../../styles/widgets/buttons.dart';
import '../../../utils/validate.dart';
import '../../providers/auth.dart';
import '../../styles/widgets/logo.dart';
import 'password/resetPasswordLink.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool isLoading = false;

  Future<void> submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      await authProvider.login(email, password);
      if (authProvider.isProfile == true) {
        Navigator.pushNamed(context, '/');
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CreateProfile(
              typeOfUser: authProvider.typeOfUser,
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
    return SafeArea(
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.resources.color.textSecondary,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                              color: context.resources.color.boxShadow,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Material(
                            type: MaterialType.transparency,
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () => Navigator.pushNamed(
                                                context, '/auth'),
                                            child: const Icon(Icons.arrow_back,
                                                size: 30)),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Login",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                    const Align(
                                        alignment: Alignment.topLeft,
                                        child: Labels.sm(
                                            text: "Lets get started")),
                                    const SizedBox(height: 40),
                                    Consumer<AuthProvider>(
                                      builder: (context, user, child) {
                                        return user.notification;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      decoration: Styles.input.copyWith(
                                        labelText: 'Email Address',
                                      ),
                                      validator: (value) {
                                        email = value!.trim();
                                        return Validate.validateEmail(value);
                                      },
                                      initialValue: 'test@driver.com',
                                    ),
                                    const SizedBox(height: 30),
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
                                    const SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                '/reset_password_link');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Labels.sm(
                                              text: "Forgot Password?",
                                              textColor: context
                                                  .resources.color.colorDark,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Buttons(
                                      onTap: submit,
                                      text: "LOGIN",
                                      color:
                                          context.resources.color.colorAccent,
                                      textColor:
                                          context.resources.color.textSecondary,
                                    ),
                                    const SizedBox(height: 80),
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
