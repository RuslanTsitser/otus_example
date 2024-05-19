import 'package:flutter/material.dart';

class LocalKeyExample extends StatefulWidget {
  const LocalKeyExample({super.key});

  @override
  State<LocalKeyExample> createState() => _LocalKeyExampleState();
}

class _LocalKeyExampleState extends State<LocalKeyExample> {
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Key Example'),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: Container(
          // key: UniqueKey(),
          key: ValueKey<Color>(_color),
          // key: ObjectKey(_color),
          color: _color,
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
