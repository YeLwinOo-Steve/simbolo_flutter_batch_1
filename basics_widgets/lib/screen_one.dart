import 'package:basics_widgets/screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: TextButton(
          onPressed: () {
            print("text is ${controller.text}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenTwo()),
            );
          },
          child: Column(
            children: [
              Text(
                'Screen One',
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter some text',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
