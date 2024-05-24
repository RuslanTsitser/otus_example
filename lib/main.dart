import 'package:basic/src/example/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MaterialScaffoldExample(),
                        ),
                      );
                    },
                    child: const Text('Material Button'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const CupertinoScaffoldExample(),
                        ),
                      );
                    },
                    child: const Text('Cupertino Button'),
                  ),
                  FilledButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const CustomSingleChildLayoutExample(),
                      //   ),
                      // );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CustomMultiChildLayoutExample(),
                        ),
                      );
                    },
                    child: const Text('Custom Layout Button'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemPink,
      ),
      home: Builder(
        builder: (context) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Home'),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MaterialScaffoldExample(),
                        ),
                      );
                    },
                    child: const Text('Cupertino Button'),
                  ),
                  CupertinoButton.filled(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const CupertinoScaffoldExample(),
                        ),
                      );
                    },
                    child: const Text('Cupertino Filled Button'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
