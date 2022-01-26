import 'package:flutter/material.dart';
import 'package:man/src/man_impl.dart';
import 'package:man/src/navigation/constants.dart';
import 'package:man/src/navigation/model/man_transition.dart';
import 'package:man/src/navigation/navigator.dart';
import 'package:man/src/navigation/route_builder.dart';

NavigatorImpl _navigator = NavigatorImpl();

extension ManNavigator on Man {
  /// Pop the top-most route off the navigator.
  void pop() {
    assert(_navigator.innerKey != null, keyNotSet);
    _navigator.innerKey!.currentState!.pop();
  }

  /// Whether the navigator can be popped.
  bool canPop() {
    assert(_navigator.innerKey != null, keyNotSet);
    return _navigator.innerKey!.currentState!.canPop();
  }

  /// Push the given route onto the navigator.
  void push(Widget page, {ManTransition transition = const ManTransition()}) {
    assert(_navigator.innerKey != null, keyNotSet);
    _navigator.innerKey!.currentState!.push(transition.route(page));
  }

  /// Replace the current route of the navigator by pushing the given route and
  /// then disposing the previous route once the new route has finished
  /// animating in.
  void pushReplacement(
    Widget page, {
    ManTransition transition = const ManTransition(),
  }) {
    assert(_navigator.innerKey != null, keyNotSet);
    _navigator.innerKey!.currentState!.pushReplacement(transition.route(page));
  }

  /// Push a route onto the navigator, and then remove all the previous routes.
  void pushAndRemoveAll(
    Widget page, {
    ManTransition transition = const ManTransition(),
  }) {
    assert(_navigator.innerKey != null, keyNotSet);
    _navigator.innerKey!.currentState!
        .pushAndRemoveUntil(transition.route(page), (route) => false);
  }

  /// Push a named route onto the navigator.
  @optionalTypeArgs
  void pushNamed(
    String name, {
    Object? arguments,
    ManTransition transition = const ManTransition(),
  }) {
    assert(_navigator.innerKey != null, keyNotSet);

    _navigator.addToStack(name, transition);
    _navigator.innerKey!.currentState!.pushNamed(name);
  }

  /// Push a named route onto the navigator, and then remove all the
  /// previous routes.
  void pushNamedAndRemoveAll(
    String name, {
    Object? arguments,
    ManTransition transition = const ManTransition(),
  }) {
    assert(_navigator.innerKey != null, keyNotSet);

    _navigator.addToStack(name, transition);
    _navigator.innerKey!.currentState!
        .pushNamedAndRemoveUntil(name, (route) => false, arguments: arguments);
  }
}
