import 'package:ai_app/assets/pages/chat_screen.dart';
import 'package:ai_app/assets/pages/home.dart';
import 'package:ai_app/assets/utils/style.dart';
import 'package:ai_app/files/about.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class option extends StatefulWidget {
  const option({super.key});

  @override
  State<option> createState() => _optionState();
}

class _optionState extends State<option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            'GenAI',
            style: GoogleFonts.abel(color: white),
          ),
          elevation: 4,
          backgroundColor: Color.fromARGB(219, 10, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => about(),
                ));
              },
              icon: Icon(
                Icons.home,
                color: white,
              ))),
      backgroundColor: Color.fromARGB(219, 10, 10, 10),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/img2.png',
              height: 100,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 240,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    backgroundColor: Colors.white12),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ));
                },
                icon: Icon(
                  Icons.generating_tokens,
                  color: white,
                ),
                label: Text(
                  'Image Generator',
                  style: GoogleFonts.abel(
                      color: Color.fromARGB(255, 98, 231, 180)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 240,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    backgroundColor: Colors.white12),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ChatScreen(),
                  ));
                },
                icon: Icon(
                  Icons.chat,
                  color: white,
                ),
                label: Text(
                  'Chat GPT',
                  style: GoogleFonts.abel(
                      color: Color.fromARGB(255, 98, 231, 180)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
