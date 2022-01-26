import 'package:flutter/material.dart';
import 'package:man/src/navigation/typedefs.dart';

/// Routes holder
class ManRoutes {
  /// Named route definitions for _Man_.
  ManRoutes(this.routes, {this.initialRoute, this.unknown})
      : assert(
          () {
            if (initialRoute != null) {
              return routes.keys.any((name) => name == initialRoute);
            }

            return true;
          }(),
        ),
        assert(
          () {
            if (unknown != null) {
              return routes.keys.any((name) => name == unknown);
            }

            return true;
          }(),
        );

  /// Named route definitions.
  ///
  /// All used routes should be in this map.
  Map<String, NamedRouteBuilder> routes;

  /// When a route is not found, this route will be used. If you are sure that
  /// all routes are defined, you don't have to set this.
  /// If a route cannot be found and [unknown] is not set, an exception will
  /// be thrown.
  ///
  /// This route should be defined in the [routes], otherwise [ManRoutes]
  /// throws an exception.
  String? unknown;

  /// This is the route when the app is started. You don't have to set this if
  /// you are planning to use MaterialApp's home property.
  ///
  /// When you provide initialRoute to only [MaterialApp], _Man_ cannot handle
  /// the starting route and throws an exception.
  ///
  /// This route should be defined in the [routes], otherwise [ManRoutes]
  /// throws an exception.
  String? initialRoute;
}
