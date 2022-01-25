import 'package:flutter/material.dart';

class FadedRoute extends PageRouteBuilder<Widget> {
  FadedRoute(Widget page, [this.curve = Curves.linear])
      : super(pageBuilder: (context, animation, secondaryAnimation) => page);

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

    return FadeTransition(
      opacity: tween,
      child: child,
    );
  }
}
