import 'package:flutter/material.dart';
import 'package:moj_task/src/ui/views/click_detector.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return ClickDetector(
      key: const ValueKey('Page2'),
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
              Text(_counter.toString()),
              Image.network(
                  'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1161.jpg'),
              TextButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
