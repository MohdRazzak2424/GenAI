import 'package:ai_app/assets/models/message.dart';
import 'package:ai_app/assets/models/messages.dart';
import 'package:ai_app/assets/utils/size.dart';
import 'package:ai_app/assets/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userMessage = TextEditingController();
  bool isLoading = false;

  static const apiKey = "AIzaSyBfb7QaTGLx1zOYIWhTj2H59DdLE2y7KDU";

  final List<Message> _messages = [];

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  void sendMessage() async {
    final message = _userMessage.text;
    _userMessage.clear();

    setState(() {
      _messages.add(Message(
        isUser: true,
        message: message,
        date: DateTime.now(),
      ));
      isLoading = true;
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
        isUser: false,
        message: response.text ?? "",
        date: DateTime.now(),
      ));
    });
  }

  void onAnimatedTextFinished() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text('GenAI Gemini',
            style: GoogleFonts.robotoSlab(
                color: white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                  onAnimatedTextFinished: onAnimatedTextFinished,
                  // onAnimatedTextFinished: onAnimatedTextFinished,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: medium, vertical: small),
            child: Expanded(
              flex: 20,
              child: TextFormField(
                maxLines: 6,
                minLines: 1,
                controller: _userMessage,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(medium, 0, small, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(xlarge),
                  ),
                  hintText: 'Enter prompt',
                  hintStyle: hintText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (!isLoading && _userMessage.text.isNotEmpty) {
                        sendMessage();
                      }
                    },
                    child: isLoading
                        ? Container(
                            width: medium,
                            height: medium,
                            margin: const EdgeInsets.all(xsmall),
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                              valueColor: AlwaysStoppedAnimation<Color>(white),
                              strokeWidth: 3,
                            ),
                          )
                        : Icon(
                            Icons.arrow_upward,
                            color: _userMessage.text.isNotEmpty
                                ? Colors.white
                                : Colors.white,
                          ),
                  ),
                ),
                style: promptText,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
