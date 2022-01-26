import 'package:flutter/material.dart';
import 'package:man/src/navigation/constants.dart';
import 'package:man/src/navigation/model/man_routes.dart';
import 'package:man/src/navigation/model/man_transition.dart';
import 'package:man/src/navigation/route_builder.dart';
import 'package:man/src/navigation/typedefs.dart';

abstract class ManNavigator {
  factory ManNavigator() = NavigatorImpl;

  /// _Man's_ navigator key. _Man_ provides navigation functionally using this
  /// key.
  GlobalKey<NavigatorState> get key;

  /// Sets named routes handled by _Man_. This routes should provided
  /// before MaterialApp widget if you are planning to use named routes.
  set routes(ManRoutes routes);

  // Named routes that handled by _Man_.
  ManRoutes get routes;

  /// Handles routes and applies [ManTransition] on navigation.
  ///
  /// **When you provide this to MaterialApp widget , you have to set
  /// [routes]** using Man.navigator.routes before MaterialApp widget created.
  PageRouteBuilder<Widget> routeHandler(RouteSettings settings);
}

class NavigatorImpl implements ManNavigator {
  factory NavigatorImpl() => _navigator;
  NavigatorImpl._();
  static final _navigator = NavigatorImpl._();

  final _stack = <String, ManTransition>{};
  GlobalKey<NavigatorState>? innerKey;
  ManRoutes manRoutes = ManRoutes({});

  void addToStack(String name, ManTransition details) => _stack[name] = details;

  @override
  GlobalKey<NavigatorState> get key =>
      innerKey ??= GlobalKey<NavigatorState>(debugLabel: 'ManNavigator');

  @override
  set routes(ManRoutes routes) {
    if (routes.initialRoute != null) {
      _stack[routes.initialRoute!] = const ManTransition();
    }

    manRoutes = routes;
  }

  @override
  ManRoutes get routes => manRoutes;

  @override
  PageRouteBuilder<Widget> routeHandler(RouteSettings settings) {
    assert(manRoutes.routes.isNotEmpty, routesNotSet);

    final request = settings.name;
    final definedRoutes = manRoutes.routes;

    if (request != null) {
      // Split requested route uri to segments
      final requestedSegments = Uri.parse(request).pathSegments;

      // Defined routes taking a trust score to determining the best match
      int trustScore = 0;

      // The best matched route
      MapEntry<String, Widget Function(List<String>)>? definedRoute;

      mainLoop:
      for (int i = 0; i < definedRoutes.length; i++) {
        // Score for this route, used to compare with the top score
        int score = 0;
        final key = definedRoutes.keys.elementAt(i);

        final definedSegments = Uri.parse(key).pathSegments;

        // Check if requested uri segments length is equal to defined route's.
        // If not, they cannot be related, skip to the next defined route.
        if (requestedSegments.length != definedSegments.length) {
          continue mainLoop;
        }

        // Find the segments that is not parameter.
        for (int i = 0; i < definedSegments.length; i++) {
          // Compare the immutable segments, if not same they cannot be related,
          // skip to the next defined route.
          //
          // For example, in uri users/:id/profile immutable parts are 'users'
          // and 'profile'.
          if (!definedSegments[i].startsWith(":") &&
              definedSegments[i] != requestedSegments[i]) continue mainLoop;

          // If the segments seems related, increase the trust score according
          // to the number of segments that are same.
          if (definedSegments[i] == requestedSegments[i]) score++;
        }

        if (score > trustScore) {
          trustScore = score;
          definedRoute = definedRoutes.entries.elementAt(i);
        }
      }

      // If no route specified, return the unknown route.
      if (definedRoute == null) {
        assert(manRoutes.unknown != null, unknownRouteNotSet);

        final unknownPage = _buildRoute(
          MapEntry(manRoutes.unknown!, manRoutes.routes[manRoutes.unknown]!),
          requestedSegments,
        );

        return const ManTransition().route(unknownPage);
      }

      final requestedRoute = _buildRoute(definedRoute, requestedSegments);

      final transition = _stack[request];

      // Applied transition to route, remove it from stack
      _stack.remove(request);

      return transition!.route(requestedRoute);
    } else {
      return const ManTransition().route(Container());
    }
  }

  Widget _buildRoute(
    MapEntry<String, NamedRouteBuilder> manRoute,
    List<String> requestedSegments,
  ) {
    // Uri pattern which user defined on creating routes
    final pattern = manRoute.key;

    // Route widget builder function
    final builder = manRoute.value;

    // Split uri to segments
    final patternSegments = Uri.parse(pattern).pathSegments;

    // Get parameters from requested uri
    final params = <String>[];

    for (int i = 0; i < patternSegments.length; i++) {
      final segment = patternSegments[i];
      if (segment.startsWith(':')) params.add(requestedSegments[i]);
    }

    return builder.call(params);
  }
}
