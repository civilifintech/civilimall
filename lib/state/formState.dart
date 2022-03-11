import 'package:civilimall/utility/constant.dart';
import 'package:civilimall/widgets/showText.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class scanForm extends StatefulWidget {
  const scanForm({Key? key}) : super(key: key);

  @override
  State<scanForm> createState() => scanFormState();
}

class scanFormState extends State<scanForm> {
  String? member_code, display_name, member_img;
  @override
  void initState() {
    super.initState();

    getMemberInfo();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(arguments['data']);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffba0c00),
        title: Text("ScanQRCode"),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(child: Text(arguments["data"])),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: Center(
                child: Text(member_code! + display_name!),
              ),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> getMemberInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      member_code = prefs.getString('member_code')!;
      display_name = prefs.getString('display_name')!;
      member_img = prefs.getString('member_img')!;
    });

    print(member_code);
    print(display_name);
  }
}
