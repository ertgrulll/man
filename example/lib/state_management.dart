import 'dart:math';

import 'package:flutter/material.dart';
import 'package:man/man.dart';

class StateManagement extends StatelessWidget {
  StateManagement({Key? key}) : super(key: key);
  final x = 5.man;
  final y = 3.man;
  final map = {1: '1', 2: '2', 3: '3'}.man;
  final list = [1, 2, 3].man;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Column(
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
          Column(
            children: [
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
            ],
          ),
          Column(
            children: [
              Man(
                builder: () => Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  color: Colors.orange,
                  child: Column(
                    children: [
                      const Text("Map test"),
                      Text(map.value.toString()),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text("Update map"),
                onPressed: () {
                  Random rand = Random();
                  final val = rand.nextInt(100);
                  map[val] = val.toString();
                  map.remove(map.keys.first);
                },
              ),
            ],
          ),
          Column(
            children: [
              Man(
                builder: () => Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  color: Colors.orange,
                  child: Column(
                    children: [
                      const Text("List test"),
                      Text(list.value.toString()),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text("Update list"),
                onPressed: () {
                  Random rand = Random();
                  final val = rand.nextInt(100);
                  list.add(val);
                  list.removeAt(0);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
