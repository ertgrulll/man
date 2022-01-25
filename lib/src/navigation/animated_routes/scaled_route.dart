import 'package:flutter/material.dart';

class ScaledRoute extends PageRouteBuilder<Widget> {
  ScaledRoute(
    Widget page, {
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.linear,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) => page);

  double begin;
  double end;
  Curve curve;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: animation, curve: curve),
    );

    return ScaleTransition(
      scale: tween,
      child: FadeTransition(
        opacity: tween,
        child: child,
      ),
    );
  }
}
