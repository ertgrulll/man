import 'package:flutter/material.dart';

import 'package:man/src/navigation/animated_routes/circular_scaled_route.dart';
import 'package:man/src/navigation/animated_routes/faded_route.dart';
import 'package:man/src/navigation/animated_routes/scaled_route.dart';
import 'package:man/src/navigation/animated_routes/sized_route.dart';
import 'package:man/src/navigation/animated_routes/slided_route.dart';
import 'package:man/src/navigation/constants.dart';

extension RouteBuilder on ManTransition {
  PageRouteBuilder<Widget> route(Widget page, Curve curve) {
    switch (this) {
      case ManTransition.fade:
        return FadedRoute(page, curve);

      case ManTransition.toRight:
        return SlidedRoute(page, const Offset(-1, 0), curve);

      case ManTransition.toLeft:
        return SlidedRoute(page, const Offset(1, 0), curve);

      case ManTransition.toBottom:
        return SlidedRoute(page, const Offset(0, -1), curve);

      case ManTransition.toTop:
        return SlidedRoute(page, const Offset(0, 1), curve);

      case ManTransition.toBottomRight:
        return SlidedRoute(page, const Offset(-1, -1), curve);

      case ManTransition.toBottomLeft:
        return SlidedRoute(page, const Offset(1, -1), curve);

      case ManTransition.toTopRight:
        return SlidedRoute(page, const Offset(-1, 1), curve);

      case ManTransition.toTopLeft:
        return SlidedRoute(page, const Offset(1, 1), curve);

      case ManTransition.shrink:
        return ScaledRoute(page, begin: 2, curve: curve);

      case ManTransition.grow:
        return ScaledRoute(page, curve: curve);

      case ManTransition.circularFromCenter:
        return CircularScaledRoute(page);

      case ManTransition.circularFromBottom:
        return CircularScaledRoute(page, alignment: Alignment.bottomCenter);

      case ManTransition.circularFromTop:
        return CircularScaledRoute(page, alignment: Alignment.topCenter);

      case ManTransition.circularFromTopRight:
        return CircularScaledRoute(page, alignment: Alignment.topRight);

      case ManTransition.circularFromTopLeft:
        return CircularScaledRoute(page, alignment: Alignment.topLeft);

      case ManTransition.circularFromBottomRight:
        return CircularScaledRoute(page, alignment: Alignment.bottomRight);

      case ManTransition.circularFromBottomLeft:
        return CircularScaledRoute(page, alignment: Alignment.bottomLeft);

      case ManTransition.expandVertical:
        return SizedRoute(page, Axis.vertical, curve: curve);

      case ManTransition.expandHorizontal:
        return SizedRoute(page, Axis.horizontal, curve: curve);

      default:
        throw Exception('Unknown transition type');
    }
  }
}
