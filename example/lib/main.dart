import 'package:flutter/material.dart';
import 'package:man/man.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final x = 5.man;
  final y = 3.man;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Man(
                () => Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  color: Colors.lightBlue,
                  child: Column(
                    children: [
                      const Text("Not binded test"),
                      Text("x: ${x.value}"),
                      Text("y: ${y.value}"),
                    ],
                  ),
                ),
              ),
              Man(
                () => Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  color: Colors.orange,
                  child: Column(
                    children: [
                      const Text("Binded test"),
                      Text("x: ${x.value}"),
                      Text("y: ${y.value}"),
                    ],
                  ),
                ),
                bindings: [y],
              ),
              ElevatedButton(
                child: const Text("Update x"),
                onPressed: () {
                  x.value++;
                },
              ),
              ElevatedButton(
                child: const Text("Update y"),
                onPressed: () {
                  y.value--;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
