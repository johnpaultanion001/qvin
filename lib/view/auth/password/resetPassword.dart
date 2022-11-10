// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';
import '../../../../styles/widgets/textField.dart';
import '../../../styles/styles.dart';
import '../../../styles/widgets/logo.dart';
import '../../../utils/validate.dart';
import 'resetPassword.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String newPassword;
  late String confirmPassword;

  Future<void> sendLink() async {
    if (_formKey.currentState!.validate()) {
      print('test');
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
                                            context, '/reset_password_link'),
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
                                            "Type in your new password. Make sure you write it down somewhere safe!")),
                                const SizedBox(height: 100),
                                TextFormField(
                                  obscureText: true,
                                  decoration: Styles.input.copyWith(
                                    labelText: 'New Password',
                                  ),
                                  validator: (value) {
                                    newPassword = value!.trim();
                                    return Validate.requiredField(
                                        value, 'Password is required.');
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: Styles.input.copyWith(
                                    labelText: 'Confirm Password',
                                  ),
                                  validator: (value) {
                                    confirmPassword = value!.trim();
                                    return Validate.confirmPassword(
                                        value, newPassword);
                                  },
                                ),
                                const SizedBox(height: 100),
                                Buttons(
                                  onTap: sendLink,
                                  text: "Confirm",
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
    );
  }
}
