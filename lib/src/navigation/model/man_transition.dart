import 'package:flutter/material.dart';
import 'package:man/src/navigation/constants.dart';

/// Transition model.
class ManTransition {
  /// Sets navigation transition, curve and duration.
  ///
  /// See [ManTransitions] for all possible animations.
  const ManTransition({
    this.transition = ManTransitions.toLeft,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 300),
  });

  /// Transition to apply on navigating.
  final ManTransitions transition;

  /// Curve to apply to transition.
  ///
  /// Curve will not affect circular transitions.
  final Curve curve;

  /// Duration to apply to transition.
  final Duration duration;
}
