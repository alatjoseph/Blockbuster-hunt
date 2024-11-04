import 'package:flutter/material.dart';

class SkMeme extends StatelessWidget {
  const SkMeme({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.black,

      body: Container(
        child: Image(image: AssetImage("assets/sureshkrishna.png")),
      ),
    );
  }
}
