import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:flutter/material.dart';

class TrollPopup{
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Wrong Guess!',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25),)),
          content: Container(
            width: 300, // Adjust the width as needed
            height: 300, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sureshkrishna.png'), // Change this to your local image path
                fit: BoxFit.cover, // Adjust fit as needed
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                child: const Text('Close',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
