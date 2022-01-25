import 'dart:math' show sqrt, max;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Circular route generator
class CircularScaledRoute extends PageRouteBuilder<Widget> {
  /// Creates a route that animated growing in a circle.
  CircularScaledRoute(Widget page, {this.alignment = Alignment.center})
      : super(pageBuilder: (context, animation, secondaryAnimation) => page);

  /// Animation start point.
  Alignment alignment;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipPath(
      clipper: CircularClipper(
        fraction: animation.value,
        centerAlignment: alignment,
      ),
      child: child,
    );
  }
}

// Credits goes to Alexander Zhdanov for this class,
// https://github.com/qwert2603
class CircularClipper extends CustomClipper<Path> {
  final double fraction;
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  double? minRadius;
  double? maxRadius;

  CircularClipper({
    required this.fraction,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final Offset center = centerAlignment?.alongSize(size) ??
        centerOffset ??
        Offset(size.width / 2, size.height / 2);
    minRadius ??= 0;
    maxRadius ??= calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(minRadius, maxRadius, fraction)!,
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
