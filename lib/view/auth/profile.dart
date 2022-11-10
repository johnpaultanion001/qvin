// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import 'package:qvin/utils/loading_screen.dart';
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
  String truckMake = 'Truck Make';
  String truckModel = 'Truck Model';
  String driverType = 'Driver Type';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String displayName;
  bool isLoading = false;
  bool? check = true;

  Future<void> submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      print('SIGNUP');
      setState(() => isLoading = true);
      await authProvider.signup(
        displayName,
        widget.email,
        widget.password,
        widget.typeOfUser,
      );
      if (authProvider.statusResponse == 200) {
        Navigator.pushNamed(context, '/');
      }
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.typeOfUser + widget.email + widget.password);
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
                                        child: Text("Create Profile",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Consumer<AuthProvider>(
                                    builder: (context, user, child) {
                                      return user.notification;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Form(
                                      key: _formKey,
                                      child: widget.typeOfUser == "driver"
                                          ? driverProfile(context)
                                          : widget.typeOfUser == "mechanic"
                                              ? mechanicProfile(context)
                                              : widget.typeOfUser ==
                                                      "police_officer"
                                                  ? policeProfile(context)
                                                  : const Text('no data')),
                                  Buttons(
                                    onTap: submit,
                                    text: "SIGNUP",
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
                ],
              ),
            ),
    );
  }

  Column driverProfile(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.topLeft,
          child: Labels.sm(
            text:
                "Now let's create your account. Please enter your details and you'll also be synched with DOTReady.",
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Driver Name',
          ),
          validator: (value) {
            displayName = value!.trim();
            return Validate.requiredField(value, 'Name is required.');
          },
          initialValue: 'Driver',
        ),
        const SizedBox(height: 10),
        InputDecorator(
          decoration: const InputDecoration(
              labelText: 'Truck Make', border: OutlineInputBorder()),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: truckMake,
              iconSize: 24,
              elevation: 16,
              isDense: true,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  truckMake = newValue!;
                });
              },
              items: <String>[
                'Truck Make',
                'Truck Make1',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        InputDecorator(
          decoration: const InputDecoration(
              labelText: 'Truck Model', border: OutlineInputBorder()),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: truckModel,
              iconSize: 24,
              elevation: 16,
              isDense: true,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  truckModel = newValue!;
                });
              },
              items: <String>[
                'Truck Model',
                'Truck Model1',
              ].map<DropdownMenuItem<String>>((String value) {
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
          labelText: 'PHONE #',
        )),
        const SizedBox(height: 10),
        InputDecorator(
          decoration: const InputDecoration(
              labelText: 'Driver Type', border: OutlineInputBorder()),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: driverType,
              iconSize: 24,
              elevation: 16,
              isDense: true,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  driverType = newValue!;
                });
              },
              items: <String>[
                'Driver Type',
                'Driver Type1',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column mechanicProfile(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.topLeft,
          child: Labels.sm(
            text:
                "Now let's create your account. Please enter your details and you'll also be synched with DOTReady.",
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Mechanic Name',
          ),
          validator: (value) {
            displayName = value!.trim();
            return Validate.requiredField(value, 'Name is required.');
          },
          initialValue: 'Mechanic',
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Company',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Phone #',
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Column policeProfile(BuildContext context) {
    return Column(
      children: <Widget>[
        const Align(
          alignment: Alignment.topLeft,
          child: Labels.sm(
            text:
                "Now let's create your account. Please enter your details and you'll also be synched with DOTReady.",
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Police Name',
          ),
          validator: (value) {
            displayName = value!.trim();
            return Validate.requiredField(value, 'Name is required.');
          },
          initialValue: 'Police',
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Country',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'City',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'State',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Phone #',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: Styles.input.copyWith(
            labelText: 'Badge #',
          ),
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          value: check,
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
          onChanged: (bool? value) {
            setState(() {
              check = value;
            });
          },
          title: const Labels.sm(
            text:
                'I understand that impersonating a police officer is a serious crime and that QVIN will help to prosecute any violation.',
          ),
        ),
      ],
    );
  }
}
