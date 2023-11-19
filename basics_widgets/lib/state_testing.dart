import 'package:flutter/material.dart';

class StateTesting extends StatefulWidget {
  const StateTesting({super.key});
  @override
  State<StateTesting> createState() => _StateTestingState();
}

class _StateTestingState extends State<StateTesting> {
  String someText = 'hello';
  @override
  void initState() {
    super.initState();
    print("widget is initiated -- ");
  }

  @override
  void dispose() {
    print("widget is disposed--");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('widget is built');
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              someText,
              style: TextStyle(fontSize: 30),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  print('widget is updated -----!!!!');
                  someText = 'Mingalarbar';
                });
              },
              child: Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}

class StatelessTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('stateless widget');
  }
}
