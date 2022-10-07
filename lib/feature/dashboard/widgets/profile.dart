import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _InformationState();
}

class _InformationState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Profile'),
    );
  }
}
