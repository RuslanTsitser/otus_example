import 'package:flutter/material.dart';

class GlobalKeyReadPropertyExample extends StatefulWidget {
  const GlobalKeyReadPropertyExample({super.key});

  @override
  State<GlobalKeyReadPropertyExample> createState() => _GlobalKeyReadPropertyExampleState();
}

class _GlobalKeyReadPropertyExampleState extends State<GlobalKeyReadPropertyExample> {
  final _myWidgetWithPropertiesKey = GlobalKey<State<MyWidgetWithProperties>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key Read Property Example'),
      ),
      body: Center(
        child: MyWidgetWithProperties(
          title: 'Hello',
          key: _myWidgetWithPropertiesKey,
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              final widget = _myWidgetWithPropertiesKey.currentWidget as MyWidgetWithProperties;
              print(widget.title);
              final state = _myWidgetWithPropertiesKey.currentState as MyWidgetWithPropertiesState;
              print(state.currentValue);
              final context = _myWidgetWithPropertiesKey.currentContext;
              print(context?.size);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              final state = _myWidgetWithPropertiesKey.currentState as MyWidgetWithPropertiesState;
              state.toggleInvisibleProperty();
            },
            child: const Icon(Icons.update),
          ),
        ],
      ),
    );
  }
}

class MyWidgetWithProperties extends StatefulWidget {
  const MyWidgetWithProperties({super.key, required this.title});
  final String title;

  @override
  State<MyWidgetWithProperties> createState() => MyWidgetWithPropertiesState();
}

class MyWidgetWithPropertiesState extends State<MyWidgetWithProperties> {
  final String _invisibleProperty1 = 'Property 1';
  final String _invisibleProperty2 = 'Property 2';
  String get currentValue => _isFirstPropertyVisible ? _invisibleProperty1 : _invisibleProperty2;

  bool _isFirstPropertyVisible = false;
  void toggleInvisibleProperty() {
    setState(() {
      _isFirstPropertyVisible = !_isFirstPropertyVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title),
        Text(_isFirstPropertyVisible ? _invisibleProperty1 : _invisibleProperty2),
        ElevatedButton(
          onPressed: toggleInvisibleProperty,
          child: const Text('Toggle Property'),
        ),
      ],
    );
  }
}
