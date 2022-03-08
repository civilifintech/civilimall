import 'package:civilimall/state/scanQRState.dart';
import 'package:civilimall/utility/constant.dart';
import 'package:civilimall/widgets/showMall.dart';
import 'package:flutter/material.dart';

class Mall extends StatefulWidget {
  const Mall({Key? key}) : super(key: key);

  @override
  State<Mall> createState() => _MallState();
}

class _MallState extends State<Mall> {
  int _selectedIndex = 2;
  static const List<Widget> _appbarwidgetOptions = <Widget>[
    Text(
      'ซื้อ Voucher',
    ),
    Text(
      'Scan QR',
    ),
    Text(
      'Shopping mall',
    ),
    Text(
      'GenQR',
    ),
    Text(
      'Home',
    ),
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Voucher',
    ),
    ScanQR(),
    showMall(),
    Text(
      'Index 3: Gen QR',
    ),
    Text(
      'Index 4: Home',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffba0c00),
        title: _appbarwidgetOptions.elementAt(_selectedIndex),
      ),
      body: SafeArea(
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffba0c00),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'ซื้อ Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'ScanQR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Mall',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'GenQR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
