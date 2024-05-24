import 'package:flutter/material.dart';

class GlobalKeySaveStateExample extends StatefulWidget {
  const GlobalKeySaveStateExample({super.key});

  @override
  State<GlobalKeySaveStateExample> createState() => _GlobalKeySaveStateExampleState();
}

class _GlobalKeySaveStateExampleState extends State<GlobalKeySaveStateExample> {
  bool _isHome = true;
  final _homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key Save State Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isHome = !_isHome;
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: !_isHome
          ? HomeView(
              // key: ValueKey(1)
              key: _homeKey,
            )
          : null,
      body: _isHome
          ? Center(
              child: HomeView(
                // key: ValueKey(1)
                key: _homeKey,
              ),
            )
          : null,
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void dispose() {
    print('HomeView disposed');
    super.dispose();
  }

  int _counter = 0;
  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Text('Counter: $_counter'),
          TextButton(
            onPressed: incrementCounter,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
