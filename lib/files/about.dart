import 'package:ai_app/assets/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 172, 172),
        shadowColor: Colors.grey,
        elevation: 2.0,
        toolbarHeight: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
        title: Text(
          'ABOUT DEVELOPERS',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(127, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              // color: white,
              width: 100,
              // color: Colors.amber,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'lib/assets/me.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'MOHD RAZZAK',
                    style: GoogleFonts.aBeeZee(color: white),
                  ),
                  Text(
                    'APP Developer',
                    style: TextStyle(color: white),
                  ),
                  Text(
                    'TRUBA INSTITUTE OF ENGINEERING & INFORMATION TECHNOLOGY',
                    style: GoogleFonts.robotoSlab(color: white, fontSize: 10),
                  ),
                  Text(
                    'B.TECH:- ARTIFICIAL INTELIGENCE AND DATA SCIENCE',
                    style: GoogleFonts.robotoSlab(color: white),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'lib/assets/sajid.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    'SAJID KHAN',
                    style: GoogleFonts.aBeeZee(color: white),
                  ),
                  Text(
                    'TRUBA INSTITUTE OF ENGINEERING & INFORMATION TECHNOLOGY',
                    style: GoogleFonts.robotoSlab(color: white, fontSize: 10),
                  ),
                  Text(
                    'B.TECH:- ARTIFICIAL INTELIGENCE AND DATA SCIENCE',
                    style: GoogleFonts.robotoSlab(color: white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
