import 'package:flutter/material.dart';
import 'package:man/man.dart';

class DumbRoute extends StatelessWidget {
  const DumbRoute({this.param1, this.param2, Key? key}) : super(key: key);

  final Object? param1;
  final Object? param2;

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
          "Uri params:\nparam1: ${param1.toString()},"
          "param2: ${param2.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
