// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, duplicate_import, prefer_is_empty, unrelated_type_equality_checks, unused_local_variable, sort_child_properties_last

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/show_money_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;

  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Container(
          color: Color.fromARGB(255, 244, 79, 95),
          child: Text(
            'คำเตือน',
            style: GoogleFonts.kanit(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(color: Color.fromARGB(255, 244, 79, 95)),
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 244, 79, 95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 193, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 79, 95),
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.20,
                    backgroundColor: Color.fromARGB(255, 244, 79, 95),
                    child: Image.asset(
                      'assets/images/money.png',
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"^[0-9]+.?[0-9]*"))
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"\d+([\.]\d+)?"))
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              setState(() {
                                tipCtrl.text = '';
                              });
                            }
                            checkStatus = value;
                          });
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"^[0-9]+.?[0-9]*"))
                    ],
                    enabled: checkStatus,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person = 0;
                            if (moneyCtrl.text.length == 0) {
                              warningMessage(context, 'ป้อนเงินด้วย...');
                              return;
                            } else if (double.parse(moneyCtrl.text) == 0) {
                              warningMessage(context, 'เงินห้ามเป็น 0');
                              return;
                            } else if (personCtrl.text.isEmpty == true) {
                              warningMessage(context, 'ป้อนคนด้วย...');
                              return;
                            } else if (int.parse(personCtrl.text) == 0) {
                              warningMessage(context, 'คนห้ามเป็น 0');
                              return;
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.length == 0) {
                                warningMessage(context, 'ป้อนทิปด้วย...');
                                return;
                              } else if (double.parse(tipCtrl.text) == 0) {
                                warningMessage(context, 'ทิปห้ามเป็น 0');
                                return;
                              } else {
                                money = double.parse(moneyCtrl.text);
                                person = int.parse(personCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyshare = money / person;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  tip: tip,
                                  person: person,
                                  moneyshare: moneyshare,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 244, 79, 95),
                              fixedSize: Size.fromHeight(
                                55.0,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              moneyCtrl.text = '';
                              personCtrl.text = '';
                              tipCtrl.text = '';
                              checkStatus = false;
                            });
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 244, 79, 95),
                              fixedSize: Size.fromHeight(
                                55.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
