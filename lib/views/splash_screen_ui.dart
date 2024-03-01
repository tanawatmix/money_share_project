// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:money_share_project/views/input_money_iu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputMoneyUI(),
        ),
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 193, 193),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CircularProgressIndicator(
              color: Colors.yellow,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'แชร์เงินกันเต๊อะ',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Colors.white,
              ),
            ),
            Text(
              'Copyright © by Tanawat DTI 2024 ^-^',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
            Text(
              'version 1.0.0',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
