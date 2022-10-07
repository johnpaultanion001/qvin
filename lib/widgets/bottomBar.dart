// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';

class BottomBar extends StatelessWidget {
  final Function(int)? onTap;
  final int? selectedIndex;

  const BottomBar({
    Key? key,
    this.onTap,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/drawable/ic_scan_qr.png')),
          label: 'Scan QR',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/drawable/ic_dvr.png')),
          label: 'DVIR',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/drawable/ic_information.png')),
          label: 'Information',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/drawable/ic_profile.png')),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex!,
      selectedItemColor: context.resources.color.colorPrimary,
      unselectedItemColor: context.resources.color.colorLightGray,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showUnselectedLabels: true,
    );
  }
}
