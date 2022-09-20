// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';

class Dashboard extends StatefulWidget {
  // final String title;

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int _selectedIndex = 0;
  late String _title;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Scan QR',
      style: optionStyle,
    ),
    Text(
      'Index 1: DVIR',
      style: optionStyle,
    ),
    Text(
      'Index 2: Information',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
            _title = 'SCAN QR CODE';
          break;
        case 1:
            _title = 'DVIR FORM';
          break;
        case 2:
            _title = 'INFORMATION';
          break;
        case 3:
            _title = 'MY PROFILE';
          break;
      }
    });
  }

  @override
  initState() {
    _title = 'SCAN QR CODE';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          if (_selectedIndex == 1)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: context.resources.color.colorAccent,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text('VISUAL MODE',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
            )
          else
            Container(),
        ],
        centerTitle: _selectedIndex != 1 ? true : false,
        backgroundColor: context.resources.color.colorPrimary,
        title: Text(
          _title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: context.resources.color.colorPrimary,
        unselectedItemColor: context.resources.color.colorLightGray,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
