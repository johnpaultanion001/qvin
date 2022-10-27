// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/styles/AppContextExtension.dart';

import '../../providers/auth.dart';
import '../../styles/styles.dart';
import '../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import '../../utils/validate.dart';

class CreateProfile extends StatefulWidget {
  String typeOfUser;
  String email;
  String password;

  CreateProfile({
    required this.typeOfUser,
    required this.email,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String dropdownValue = 'One';
  List<String> location = ['One', 'Two', 'Three', 'Four'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form != null) {
      form.validate();
      print('SIGNUP');
      form.validate();
      await Provider.of<AuthProvider>(context, listen: false).signup(
        firstName,
        lastName,
        widget.email,
        widget.password,
        widget.typeOfUser,
      );
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.typeOfUser + widget.email + widget.password);
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
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Center(
                      child: Material(
                        type: MaterialType.transparency,
                        child: Expanded(
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
                                      child: Text("Create Profile",
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
                                          child: Text("Create a profile")),
                                      const SizedBox(height: 30),
                                      TextFormField(
                                          decoration: Styles.input.copyWith(
                                            labelText: 'First Name',
                                          ),
                                          validator: (value) {
                                            firstName = value!.trim();
                                            return Validate.requiredField(value,
                                                'First name is required.');
                                          }),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                          decoration: Styles.input.copyWith(
                                            labelText: 'Last Name',
                                          ),
                                          validator: (value) {
                                            lastName = value!.trim();
                                            return Validate.requiredField(value,
                                                'Last name is required.');
                                          }),
                                      const SizedBox(height: 10),
                                      InputDecorator(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder()),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint:
                                                const Text('Select a vehicle '),
                                            value: dropdownValue,
                                            iconSize: 24,
                                            elevation: 16,
                                            isDense: true,
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                              });
                                            },
                                            items: <String>[
                                              'One',
                                              'Two',
                                              'Free',
                                              'Four'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                          decoration: Styles.input.copyWith(
                                        labelText: 'DOT #',
                                      )),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                          decoration: Styles.input.copyWith(
                                        labelText: 'PHONE NUMBER',
                                      )),
                                      const SizedBox(height: 70),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: Buttons(
                                          onTap: submit,
                                          text: "SIGNUP",
                                          color: context
                                              .resources.color.colorAccent,
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
            ),
          ],
        ),
      ),
    );
  }
}
