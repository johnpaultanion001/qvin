import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

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
                            child: Text("Create Profile",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text("Create Profile")),
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
                            hintText: 'Driver Name'),
                      ),
                      const SizedBox(height: 10),
                      InputDecorator(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: const Text('Select a vehicle '),
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
                            hintText: 'DOT #'),
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
                            hintText: 'Phone #'),
                      ),
                      const SizedBox(height: 90),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: context.resources.color.colorAccent,
                                borderRadius: BorderRadius.circular(32)),
                            child: const Center(
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
