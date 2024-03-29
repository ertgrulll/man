import 'package:flutter/material.dart';

class SlidedRoute extends PageRouteBuilder<Widget> {
  SlidedRoute(this.page, this.begin, this.curve, Duration duration)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
        );

  Widget page;
  Offset begin;
  Curve curve;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(begin: begin, end: Offset.zero).animate(
      CurvedAnimation(parent: animation, curve: curve),
    );

    return SlideTransition(
      position: tween,
      child: child,
    );
  }
}
