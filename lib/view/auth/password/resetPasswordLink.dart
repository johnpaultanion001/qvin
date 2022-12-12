// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';
import '../../../styles/styles.dart';
import '../../../styles/widgets/logo.dart';
import '../../../utils/validate.dart';
import 'resetPassword.dart';

class ResetPasswordLink extends StatefulWidget {
  const ResetPasswordLink({Key? key}) : super(key: key);

  @override
  State<ResetPasswordLink> createState() => _ResetPasswordLinkState();
}

class _ResetPasswordLinkState extends State<ResetPasswordLink> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  Future<void> sendLink() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/reset_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () => Navigator.pushNamed(
                                              context, '/login'),
                                          child: const Icon(Icons.arrow_back,
                                              size: 30)),
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Reset Password",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                  const Align(
                                      alignment: Alignment.topCenter,
                                      child: Labels.sm(
                                          text:
                                              "Enter your email address and we'll send you a password reset email.")),
                                  const SizedBox(height: 100),
                                  TextFormField(
                                    decoration: Styles.input.copyWith(
                                      labelText: 'Email Address',
                                    ),
                                    validator: (value) {
                                      email = value!.trim();
                                      return Validate.validateEmail(value);
                                    },
                                  ),
                                  const SizedBox(height: 130),
                                  Buttons(
                                    onTap: sendLink,
                                    text: "Send Link",
                                    color: context.resources.color.colorAccent,
                                    textColor:
                                        context.resources.color.textSecondary,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() async {
    final backButton = await Navigator.of(context).push<bool?>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => const ResetPassword(),
      ),
    );
    if (backButton == null || backButton == false) {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
