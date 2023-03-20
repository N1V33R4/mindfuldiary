import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandNum extends StatefulWidget {
  const RandNum({super.key, required this.title});

  final String title;
  @override
  State<RandNum> createState() => _RandNumState();
}

class _RandNumState extends State<RandNum> {
  int _counter = 0;
  static const platform = MethodChannel('example.com/channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kotlin generates the following number:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() async {
            _counter = await platform.invokeMethod('getRandomNumber');
          });
        },
        tooltip: 'Generate',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
