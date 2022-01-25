import 'package:flutter/material.dart';
import 'package:man/src/man_impl.dart';
import 'package:man/src/navigation/constants.dart';
import 'package:man/src/navigation/route_builder.dart';
import 'package:meta/meta.dart';

GlobalKey<NavigatorState>? _key;

GlobalKey<NavigatorState> get key => _key ??= GlobalKey<NavigatorState>();

extension ManNavigator on Man {
  /// Pop the top-most route off the navigator.
  void pop() {
    assert(_key != null, keyNotSet);
    _key!.currentState!.pop();
  }

  /// Whether the navigator can be popped.
  bool canPop() {
    assert(_key != null, keyNotSet);
    return _key!.currentState!.canPop();
  }

  /// Push the given route onto the navigator.
  void push(
    Widget page, {
    ManTransition transition = ManTransition.toLeft,
    Curve curve = Curves.linear,
  }) {
    assert(_key != null, keyNotSet);
    _key!.currentState!.push(transition.route(page, curve));
  }

  /// Replace the current route of the navigator by pushing the given route and
  /// then disposing the previous route once the new route has finished
  /// animating in.
  void pushReplacement(
    Widget page, {
    ManTransition transition = ManTransition.toLeft,
    Curve curve = Curves.linear,
  }) {
    assert(_key != null, keyNotSet);
    _key!.currentState!.pushReplacement(transition.route(page, curve));
  }

  /// Push a route onto the navigator, and then remove all the previous routes.
  void pushAndRemoveAll(
    Widget page, {
    ManTransition transition = ManTransition.toLeft,
    Curve curve = Curves.linear,
  }) {
    assert(_key != null, keyNotSet);
    _key!.currentState!
        .pushAndRemoveUntil(transition.route(page, curve), (route) => false);
  }

  // TODO(ertgrulll): Fix named routes.
  //  It might be better to explicitly provide the animations and give option
  //  to manually add them to "onGenerateRoute" or directly supplying this
  //  method.

  /// Push a named route onto the navigator.
  @optionalTypeArgs
  void pushNamed(
    String name, {
    Object? arguments,
    @experimental ManTransition transition = ManTransition.toLeft,
    @experimental Curve curve = Curves.linear,
  }) {
    assert(_key != null, keyNotSet);

    _key!.currentState!.pushNamed(name);
  }

  /// Push a named route onto the navigator, and then remove all the
  /// previous routes.
  void pushNamedAndRemoveAll(
    String name, {
    @experimental ManTransition transition = ManTransition.toLeft,
    @experimental Curve curve = Curves.linear,
  }) {
    assert(_key != null, keyNotSet);

    _key!.currentState!.pushNamedAndRemoveUntil(name, (route) => false);
  }
}
