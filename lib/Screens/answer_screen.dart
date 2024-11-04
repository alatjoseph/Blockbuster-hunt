import 'package:blockbuster_hunt/Constants/answers.dart';
import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/Screens/question_screen.dart';
import 'package:blockbuster_hunt/widgets/troll_popup.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatelessWidget {
  int level;
   AnswerScreen({required this.level, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.6,
              child: Image(
                image: AssetImage("assets/bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(
                0.4), // Adjust opacity here for darker or lighter shade
          ),
          AppBar(
              backgroundColor: Colors.black12,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: kwhite,
                iconSize: 30,
              )),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.7,
                ),
                Text(
                  'Enter the answer of Level ${level+1}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25, color: kwhite),
                ),
                Padding(
                  padding:  EdgeInsets.all(28.0),
                  child: TextField(
                    style: TextStyle(fontSize: 24,color: kwhite),
                    controller: _controller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kwhite), // Focused border color
                      ),
                    ),
                  ),
                ),
                
                ElevatedButton(
                  onPressed: () {
                    var text = _controller.text.toString();
                    String formattedText = FormatText(text);
                    if (formattedText == answers[level]) {
                      
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QuestionScreen(level: level+1,),
                      ));
                    } else {
                      TrollPopup.show(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15), // Padding
                    shape: RoundedRectangleBorder(
                      // Shape
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5, // Elevation
                  ),
                  child: const Text('Submit Answer',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String FormatText(String originalText) {
    String formattedText =
        originalText.replaceAll(RegExp(r'\s+'), '').trim().toUpperCase();
    return formattedText;
  }
}
