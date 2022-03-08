import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:civilimall/utility/constant.dart';
import 'package:civilimall/widgets/showImage.dart';
import 'package:civilimall/widgets/showText.dart';
import 'package:civilimall/utility/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Constant.bgLogin), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Color(0xff570a0a).withOpacity(0.6),
                Color(0xff570a0a),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildImage(screenSize),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "MemberCode",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Color(0xffffffff).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Constant.primary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Constant.primary)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          filled: true,
                          fillColor: Color(0xffffffff).withOpacity(0.9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Constant.primary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Constant.primary)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Constant.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: ElevatedButton(
                        onPressed: () async {
                          //print(nameController.text);
                          //print(passwordController.text);

                          final response = await http.post(
                            Uri.parse(
                                "https://ws.civilifintech.com/api/v1/memberAuth"),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'member_code': nameController.text,
                              'password': passwordController.text
                            }),
                          );
                          if (response.statusCode == 200) {
                            //print(response.body);
                            final parsed = jsonDecode(response.body);

                            if (parsed['status_code'] == "100") {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'member_code', parsed['member_code']);
                              await prefs.setString(
                                  'display_name', parsed['display_name']);
                              await prefs.setString('token', parsed['token']);
                              Navigator.restorablePushNamedAndRemoveUntil(
                                  context,
                                  Constant.routeMall,
                                  (route) => false);
                            } else {
                              MyDialog().normalDialog(
                                  context, "Alert", parsed['response_message']);
                            }
                          } else {
                            // If that call was not successful, throw an error.
                            MyDialog()
                                .normalDialog(context, "Alert", "API Error");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Constant.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "It's your first time here?",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              color: Constant.primary,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// class _AuthenState extends State<Authen> {
//   @override
//   Widget build(BuildContext context) {
//     double screenSize = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             buildImage(screenSize),
//             buildText(Constant.appName),
//           ],
//         ),
//       ),
//     );
//   }

  Row buildText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowText(
          text: text,
          textStyle: Constant().h1Style(),
        ),
      ],
    );
  }

  Row buildImage(double screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenSize * 0.3,
          child: ShowImage(path: Constant.logo),
        ),
      ],
    );
  }
}
