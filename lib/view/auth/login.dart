import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';
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
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form != null) {
      print('LOGIN VIEW');
      form.validate();
      await Provider.of<AuthProvider>(context, listen: false)
          .login(email, password);
      Navigator.pushNamed(context, '/');
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
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Labels.lg(
                                      text: 'Login',
                                      textColor:
                                          context.resources.color.textPrimary,
                                    )),
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Labels.sm(text: "Lets get started")),
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
                                  initialValue: 'test@test.com',
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
                                      onTap: _resetPasswordLink,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child:
                                            Labels.sm(text: "Forgot Password?"),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Labels.sm(
                                          text: "Create Account?",
                                          textColor: context
                                              .resources.color.textPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Buttons(
                                    onTap: submit,
                                    text: "LOGIN",
                                    color: context.resources.color.colorAccent,
                                    textColor:
                                        context.resources.color.textSecondary,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  void _resetPasswordLink() async {
    final backButton = await Navigator.of(context).push<bool?>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => const ResetPasswordLink(),
      ),
    );
    if (backButton == null || backButton == false) {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
