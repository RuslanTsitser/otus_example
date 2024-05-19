import 'package:flutter/material.dart';

class SimpleInheritedWidgetExample extends StatefulWidget {
  const SimpleInheritedWidgetExample({super.key});

  @override
  State<SimpleInheritedWidgetExample> createState() => _SimpleInheritedWidgetExampleState();
}

class _SimpleInheritedWidgetExampleState extends State<SimpleInheritedWidgetExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidget(
      count: _count,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _Counter(),
              const _CounterStateFul(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Update the count
                  setState(() {
                    _count++;
                  });
                },
                child: const Text('Increment Count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    final int count = CounterInheritedWidget.of(context).count;
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class _CounterStateFul extends StatefulWidget {
  const _CounterStateFul();

  @override
  State<_CounterStateFul> createState() => _CounterStateFulState();
}

class _CounterStateFulState extends State<_CounterStateFul> {
  late int _count;

  @override
  void didChangeDependencies() {
    _count = CounterInheritedWidget.of(context).count;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Count: $_count',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class CounterInheritedWidget extends InheritedWidget {
  final int count;

  const CounterInheritedWidget({
    super.key,
    required this.count,
    required super.child,
  });

  static CounterInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterInheritedWidget oldWidget) {
    return count != oldWidget.count;
  }
}
