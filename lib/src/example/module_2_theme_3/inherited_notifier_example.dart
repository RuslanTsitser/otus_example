import 'package:flutter/material.dart';

class InheritedNotifierExample extends StatefulWidget {
  const InheritedNotifierExample({super.key});

  @override
  State<InheritedNotifierExample> createState() => _InheritedNotifierExampleState();
}

class _InheritedNotifierExampleState extends State<InheritedNotifierExample> {
  final CounterNotifier _counterNotifier = CounterNotifier();

  @override
  void dispose() {
    _counterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CounterInheritedNotifier(
      notifier: _counterNotifier,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Example'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Counter(),
              SizedBox(height: 16),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        CounterInheritedNotifier.of(context, listen: false).increment();
      },
      child: const Text('Increment Count'),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    final int count = CounterInheritedNotifier.of(context).count;
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class CounterInheritedNotifier extends InheritedNotifier<CounterNotifier> {
  const CounterInheritedNotifier({
    super.key,
    super.notifier,
    required super.child,
  });

  static CounterNotifier of(BuildContext context, {bool listen = true}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<CounterInheritedNotifier>()!.notifier!
        : context.getInheritedWidgetOfExactType<CounterInheritedNotifier>()!.notifier!;
  }

  // not necessary to override this method
  // @override
  // bool updateShouldNotify(covariant CounterInheritedNotifier oldWidget) {
  //   return false; // oldWidget.notifier?.count != notifier?.count;
  // }
}

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
