// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir_visual.dart';
import 'package:qvin/view/dashboard/contents/information/information.dart';
import 'package:qvin/view/dashboard/contents/profile/profile.dart';
import 'package:qvin/view/dashboard/contents/scan_qr/scan_qr.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/bottomBar.dart';
import '../../providers/auth.dart';
import '../../utils/loading.dart';
import 'contents/dvir/dvir.dart';

class Dashboard extends StatefulWidget {
  int selectedItem;
  Dashboard({
    Key? key,
    this.selectedItem = 0,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  late String _title;
  bool isLoading = false;

  final List<Widget> _widgetOptions = <Widget>[
    ScanQR(),
    DVIRVisual(),
    Information(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        widget.selectedItem = index;
        switch (index) {
          case 0:
            _title = 'SCAN QR CODE';
            break;
          case 1:
            _title = 'DVIR';
            break;
          case 2:
            _title = 'INFORMATION';
            break;
          case 3:
            _title = 'MY PROFILE';
            break;
        }
      },
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to logout?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).logOut();
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  initState() {
    _title = 'SCAN QR CODE';
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPage()
      : WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                if (widget.selectedItem == 1)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard(
                                    selectedItem: 4,
                                  )),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: context.resources.color.colorLightGray),
                            color: context.resources.color.colorAccent,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text('FORM MODE',
                              style: TextStyle(
                                  color: context.resources.color.colorWhite,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  )
                else
                  Container(),
              ],
              centerTitle: widget.selectedItem != 1 ? true : false,
              backgroundColor: context.resources.color.colorPrimary,
              elevation: 0,
              title: Text(
                _title,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: _widgetOptions.elementAt(widget.selectedItem),
            ),
            bottomNavigationBar: BottomBar(
              onTap: _onItemTapped,
              selectedIndex: widget.selectedItem,
            ),
          ),
        );
}
