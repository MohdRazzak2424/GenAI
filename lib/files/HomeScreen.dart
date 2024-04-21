import 'dart:async';

import 'package:ai_app/files/option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => option(),
      //   ),
      // );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => option(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'lib/assets/img1.png',
              fit: BoxFit.cover,
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  SpinKitChasingDots(
                    color: const Color.fromARGB(255, 17, 87, 144),
                    size: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Presented By Truba Cubicles',
                    style: GoogleFonts.lato(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
