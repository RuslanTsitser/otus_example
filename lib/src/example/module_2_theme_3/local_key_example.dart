import 'package:flutter/material.dart';

class LocalKeyExample extends StatefulWidget {
  const LocalKeyExample({super.key});

  @override
  State<LocalKeyExample> createState() => _LocalKeyExampleState();
}

class _LocalKeyExampleState extends State<LocalKeyExample> {
  Color _color = Colors.red;
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Key Example'),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child:
            //  _count == 0
            //     ? SizedBox(
            //         child: Text(
            //           'Count: $_count',
            //           style: const TextStyle(fontSize: 24),
            //         ),
            //       )
            //     :
            Container(
          // key: UniqueKey(),
          key: ValueKey<int>(_count),
          // key: ObjectKey(_color),
          color: _color,
          child: Center(
            child: Text(
              'Count: $_count',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                setState(() {
                  _color = Colors.blue;
                  // _count = 1;
                });
              },
              child: const Icon(
                Icons.add,
              )),
          const SizedBox(height: 8),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                _color = Colors.red;
                // _count = 0;
              });
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
