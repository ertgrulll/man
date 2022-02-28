import 'package:flutter/material.dart';

import 'package:man/man.dart';

import 'package:example/dumb_route.dart';
import 'package:example/navigation.dart';
import 'package:example/state_management.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key) {
    // Assign your routes to man routes
    Man.navigator.routes = ManRoutes(
      {
        'app': (s) => const MyApp(),
        'route2': (s) => const DumbRoute(),
        'route2/:param1': (s) => DumbRoute(param1: s[0]),
        'route2/:param1/:param2': (s) => DumbRoute(param1: s[0], param2: s[1]),
        'route2/:param1/:profile': (s) => DumbRoute(param1: s[0], param2: s[1]),
        'route2/:param1/profile': (s) => DumbRoute(param1: s[0]),
      },
      initialRoute: 'app',
      unknown: 'route2',
    );
  }

  @override
  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.auto_awesome),
                text: 'State Management',
              ),
              Tab(
                icon: Icon(Icons.navigation),
                text: 'Navigation',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              StateManagement(),
              const Navigation(),
            ],
          ),
        ),
      ),
    );
  }
}
