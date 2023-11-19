import 'package:basics_widgets/state_testing.dart';
import 'package:flutter/material.dart';

import 'screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: const StateTesting(),
      home: ScreenOne(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_sharp),
        foregroundColor: Colors.black,
        title: Text(
          "Flutter Basics",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
        actions: [
          const Icon(Icons.add_alert),
        ],
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       width: 200,
          //       height: 200,
          //       color: Colors.red.shade100,
          //       child: Text(
          //         'Hello',
          //         style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //           fontStyle: FontStyle.italic,
          //           color: Colors.indigoAccent,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: 200,
          //       height: 200,
          //       color: Colors.teal,
          //     ),
          //   ],
          // ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      )
    );
  }
}
