import 'package:flutter/material.dart';
import 'package:moj_task/src/ui/screens/page2.dart';
import 'package:moj_task/src/ui/views/click_detector.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _counter = 0;

  void _navigateToPage2() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2(title: 'Page 2')));
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClickDetector(
      key: const ValueKey('Page1'),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _navigateToPage2,
          tooltip: 'Navigate to Page 2',
          child: const Icon(Icons.forward),
        ),
      ),
    );
  }
}
