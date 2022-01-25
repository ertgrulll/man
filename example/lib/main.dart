import 'package:flutter/material.dart';
import 'package:man/man.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyApp(),
      navigatorKey: Man.key,
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
                builder: () => Container(
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
                builder: () => Container(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _createRoutingButton(ManTransition.fade),
                    _createRoutingButton(ManTransition.circularFromTop),
                    _createRoutingButton(ManTransition.circularFromBottom),
                    _createRoutingButton(ManTransition.circularFromTopRight),
                    _createRoutingButton(ManTransition.circularFromTopLeft),
                    _createRoutingButton(ManTransition.circularFromBottomRight),
                    _createRoutingButton(ManTransition.circularFromBottomLeft),
                    _createRoutingButton(ManTransition.circularFromCenter),
                    _createRoutingButton(ManTransition.expandHorizontal),
                    _createRoutingButton(ManTransition.expandVertical),
                    _createRoutingButton(ManTransition.shrink),
                    _createRoutingButton(ManTransition.grow),
                    _createRoutingButton(ManTransition.toLeft),
                    _createRoutingButton(ManTransition.toRight),
                    _createRoutingButton(ManTransition.toTop),
                    _createRoutingButton(ManTransition.toBottom),
                    _createRoutingButton(ManTransition.toTopLeft),
                    _createRoutingButton(ManTransition.toTopRight),
                    _createRoutingButton(ManTransition.toBottomLeft),
                    _createRoutingButton(ManTransition.toBottomRight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createRoutingButton(ManTransition transition) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        child: Text("$transition"),
        onPressed: () {
          Man.push(
            const Route2(),
            transition: transition,
          );
        },
      ),
    );
  }
}

class Route2 extends StatelessWidget {
  const Route2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route 2"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Man.pop,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text(
          "Route 2",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
