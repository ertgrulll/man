import 'package:flutter/material.dart';

import 'package:man/src/navigation/animated_routes/circular_scaled_route.dart';
import 'package:man/src/navigation/animated_routes/faded_route.dart';
import 'package:man/src/navigation/animated_routes/scaled_route.dart';
import 'package:man/src/navigation/animated_routes/sized_route.dart';
import 'package:man/src/navigation/animated_routes/slided_route.dart';
import 'package:man/src/navigation/constants.dart';
import 'package:man/src/navigation/model/man_transition.dart';

extension RouteBuilder on ManTransition {
  PageRouteBuilder<Widget> route(Widget page) {
    switch (transition) {
      case ManTransitions.fade:
        return FadedRoute(
          page,
          curve,
          duration,
        );

      case ManTransitions.toRight:
        return SlidedRoute(
          page,
          const Offset(-1, 0),
          curve,
          duration,
        );

      case ManTransitions.toLeft:
        return SlidedRoute(
          page,
          const Offset(1, 0),
          curve,
          duration,
        );

      case ManTransitions.toBottom:
        return SlidedRoute(
          page,
          const Offset(0, -1),
          curve,
          duration,
        );

      case ManTransitions.toTop:
        return SlidedRoute(
          page,
          const Offset(0, 1),
          curve,
          duration,
        );

      case ManTransitions.toBottomRight:
        return SlidedRoute(
          page,
          const Offset(-1, -1),
          curve,
          duration,
        );

      case ManTransitions.toBottomLeft:
        return SlidedRoute(
          page,
          const Offset(1, -1),
          curve,
          duration,
        );

      case ManTransitions.toTopRight:
        return SlidedRoute(
          page,
          const Offset(-1, 1),
          curve,
          duration,
        );

      case ManTransitions.toTopLeft:
        return SlidedRoute(
          page,
          const Offset(1, 1),
          curve,
          duration,
        );

      case ManTransitions.shrink:
        return ScaledRoute(
          page,
          duration: duration,
          begin: 2,
          curve: curve,
        );

      case ManTransitions.grow:
        return ScaledRoute(
          page,
          duration: duration,
          curve: curve,
        );

      case ManTransitions.circularFromCenter:
        return CircularScaledRoute(
          page,
          duration,
        );

      case ManTransitions.circularFromBottom:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.bottomCenter,
        );

      case ManTransitions.circularFromTop:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.topCenter,
        );

      case ManTransitions.circularFromTopRight:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.topRight,
        );

      case ManTransitions.circularFromTopLeft:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.topLeft,
        );

      case ManTransitions.circularFromBottomRight:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.bottomRight,
        );

      case ManTransitions.circularFromBottomLeft:
        return CircularScaledRoute(
          page,
          duration,
          alignment: Alignment.bottomLeft,
        );

      case ManTransitions.expandVertical:
        return SizedRoute(
          page,
          Axis.vertical,
          curve,
          duration,
        );

      case ManTransitions.expandHorizontal:
        return SizedRoute(
          page,
          Axis.horizontal,
          curve,
          duration,
        );

      default:
        throw Exception('Unknown transition type');
    }
  }
}
