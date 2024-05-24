import 'package:flutter/material.dart';

class InheritedWidgetExampleWithCallback extends StatefulWidget {
  const InheritedWidgetExampleWithCallback({super.key});

  @override
  State<InheritedWidgetExampleWithCallback> createState() => _InheritedWidgetExampleWithCallbackState();
}

class _InheritedWidgetExampleWithCallbackState extends State<InheritedWidgetExampleWithCallback> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CounterInheritedWidgetWithCallback(
      callback: () {
        setState(() {
          _count++;
        });
      },
      count: _count,
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
        CounterInheritedWidgetWithCallback.of(context, listen: false).callback?.call();
      },
      child: const Text('Increment Count'),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    final int count = CounterInheritedWidgetWithCallback.of(context).count;
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class CounterInheritedWidgetWithCallback extends InheritedWidget {
  final int count;
  final VoidCallback? callback;

  const CounterInheritedWidgetWithCallback({
    super.key,
    required this.count,
    this.callback,
    required super.child,
  });

  static CounterInheritedWidgetWithCallback of(BuildContext context, {bool listen = true}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<CounterInheritedWidgetWithCallback>()!
        : context.getInheritedWidgetOfExactType<CounterInheritedWidgetWithCallback>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterInheritedWidgetWithCallback oldWidget) {
    return count != oldWidget.count;
  }
}
