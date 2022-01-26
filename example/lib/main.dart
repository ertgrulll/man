import 'package:flutter/material.dart';
import 'package:man/man.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Man.navigator.routes = ManRoutes(
      {
        'app': (s) => const MyApp(),
        'route2': (s) => const Route2(),
        'route2/:param1': (s) => Route2(param1: s[0]),
        'route2/:param1/:param2': (s) => Route2(param1: s[0], param2: s[1]),
        'route2/:param1/:profile': (s) => Route2(param1: s[0], param2: s[1]),
        'route2/:param1/profile': (s) => Route2(param1: s[0]),
      },
      initialRoute: 'app',
      unknown: 'route2',
    );

    return MaterialApp(
      initialRoute: 'app',
      navigatorKey: Man.navigator.key,
      onGenerateRoute: Man.navigator.routeHandler,
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
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.fade,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromTop,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromBottom,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromTopRight,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromTopLeft,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromBottomRight,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromBottomLeft,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.circularFromCenter,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.expandHorizontal,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.expandVertical,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.shrink,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.grow,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toLeft,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toRight,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toTop,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toBottom,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toTopLeft,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toTopRight,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toBottomLeft,
                    )),
                    _createRoutingButton(const ManTransition(
                      transition: ManTransitions.toBottomRight,
                    )),
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
        child: Text("${transition.transition}"),
        onPressed: () {
          Man.pushNamed(
            'route2/12345/profile',
            transition: transition,
          );
        },
      ),
    );
  }
}

class Route2 extends StatelessWidget {
  const Route2({this.param1, this.param2, Key? key}) : super(key: key);

  final String? param1;
  final String? param2;

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
        child: Text(
          "Uri params:\nparam1: $param1, param2: $param2",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
