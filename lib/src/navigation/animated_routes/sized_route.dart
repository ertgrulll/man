import 'package:flutter/material.dart';

class SizedRoute extends PageRouteBuilder<Widget> {
  SizedRoute(this.page, this.axis, this.curve, Duration duration)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
        );

  Widget page;
  Axis axis;
  Curve curve;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animation, curve: curve),
    );

    return Align(
      child: FadeTransition(
        opacity: tween,
        child: SizeTransition(
          sizeFactor: tween,
          axis: axis,
          child: child,
        ),
      ),
    );
  }
}
