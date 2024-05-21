import 'package:flutter/material.dart';

class InheritedModelExample extends StatefulWidget {
  const InheritedModelExample({super.key});

  @override
  State<InheritedModelExample> createState() => _InheritedNotifierExampleState();
}

class _InheritedNotifierExampleState extends State<InheritedModelExample> {
  Color _color = Colors.red;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CounterInheritedModel(
      count: _count,
      color: _color,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _Counter(),
              const _Color(),
              const SizedBox(height: 16),
              _Button(
                onColorPressed: () {
                  setState(() {
                    _color = _color == Colors.red ? Colors.blue : Colors.red;
                  });
                },
                onCountPressed: () {
                  setState(() {
                    _count++;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onCountPressed,
    required this.onColorPressed,
  });
  final VoidCallback onCountPressed;
  final VoidCallback onColorPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onCountPressed,
          child: const Text('Change Count'),
        ),
        ElevatedButton(
          onPressed: onColorPressed,
          child: const Text('Change Color'),
        ),
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    print('build _Counter');
    final int count = CounterInheritedModel.of(context, aspect: 'count').count;
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color();

  @override
  Widget build(BuildContext context) {
    print('build _Color');
    final Color color = CounterInheritedModel.of(context, aspect: 'color').color;
    return SizedBox(
      height: 100,
      width: 100,
      child: ColoredBox(
        color: color,
      ),
    );
  }
}

class CounterInheritedModel extends InheritedModel<String> {
  const CounterInheritedModel({
    super.key,
    required super.child,
    required this.count,
    required this.color,
  });

  final int count;
  final Color color;

  static CounterInheritedModel of(BuildContext context, {required String aspect, bool listen = true}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<CounterInheritedModel>(aspect: aspect)!
        : context.getInheritedWidgetOfExactType<CounterInheritedModel>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterInheritedModel oldWidget) {
    return oldWidget.count != count || oldWidget.color != color;
  }

  @override
  bool updateShouldNotifyDependent(covariant CounterInheritedModel oldWidget, Set<String> dependencies) {
    if (dependencies.contains('count')) {
      return oldWidget.count != count;
    }
    if (dependencies.contains('color')) {
      return oldWidget.color != color;
    }
    return false;
  }
}
