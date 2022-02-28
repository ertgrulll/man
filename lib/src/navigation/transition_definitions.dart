/// Transition types, defines the animation type for navigation.
enum ManTransitions {
  /// Fades page in.
  fade,

  /// Slides page to right, page enters screen from left.
  toRight,

  /// Slides page to left, page enters screen from right.
  toLeft,

  /// Slides page to bottom, page enters screen from top.
  toBottom,

  /// Slides page to top, page enters screen from bottom.
  toTop,

  /// Slides page to bottom right, page enters screen from top left.
  toBottomRight,

  /// Slides page to bottom left, page enters screen from top right.
  toBottomLeft,

  /// Slides page to top right, page enters screen from bottom left.
  toTopRight,

  /// Slides page to top left, page enters screen from top right.
  toTopLeft,

  /// Scales page size from 2.0 to cover, page shrinks to the center.
  shrink,

  /// Scales page size from 0.0 to cover in it's natural shape, page enters
  /// screen from the center.
  grow,

  /// Scales page size from 0.0 to cover in a circle, page enters screen from
  /// the center.
  circularFromCenter,

  /// Scales page in a circle, page enters screen from the bottom center.
  circularFromBottom,

  /// Scales page in a circle, page enters screen from the top center.
  circularFromTop,

  /// Scales page in a circle, page enters screen from the top right.
  circularFromTopRight,

  /// Scales page in a circle, page enters screen from the top left.
  circularFromTopLeft,

  /// Scales page in a circle, page enters screen from the bottom right.
  circularFromBottomRight,

  /// Scales page in a circle, page enters screen from the bottom left.
  circularFromBottomLeft,

  /// Expands page over y axis from center.
  expandVertical,

  /// Expands page over x axis from center.
  expandHorizontal,
}
