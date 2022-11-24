// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/providers/dashboardProvider.dart';
import 'package:qvin/view/dashboard/contents/dvir/dvir.dart';
import 'package:qvin/view/dashboard/contents/information/information.dart';
import 'package:qvin/view/dashboard/contents/profile/profile.dart';
import 'package:qvin/view/dashboard/contents/scan_qr/add_new_trailer.dart';
import 'package:qvin/view/dashboard/contents/scan_qr/scan_qr.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/bottomBar.dart';
import '../../providers/auth.dart';
import '../../utils/loading.dart';

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
  late String _titleButton;
  bool isLoading = false;

  final List<Widget> _widgetOptions = <Widget>[
    ScanQR(),
    DVIR(),
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

  Future<void> isFormDvir() async {
    final dashboardProvider =
        Provider.of<DashboardProvider>(context, listen: false);
    dashboardProvider.isFormDVIR();
    if (dashboardProvider.isForm == true) {
      setState(() => _titleButton = 'FORM MODE');
    } else {
      setState(() => _titleButton = 'VISUAL MODE');
    }
  }

  @override
  initState() {
    _title = 'SCAN QR CODE';
    _titleButton = 'FORM MODE';
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
                      onTap: isFormDvir,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: context.resources.color.colorLightGray),
                            color: context.resources.color.colorAccent,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(_titleButton,
                              style: TextStyle(
                                  color: context.resources.color.colorWhite,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  )
                else if (widget.selectedItem == 0)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewTrailer()),
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
                          child: Text('ADD NEW TRAILER MODE',
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
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  _title,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
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
