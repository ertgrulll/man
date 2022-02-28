import 'package:flutter/material.dart';
import 'package:man/man.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.fade,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromTop,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromBottom,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromTopRight,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromTopLeft,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromBottomRight,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromBottomLeft,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.circularFromCenter,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.expandHorizontal,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.expandVertical,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.shrink,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.grow,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toLeft,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toRight,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toTop,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toBottom,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toTopLeft,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toTopRight,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toBottomLeft,
          )),
          _createRoutingButton(const ManTransition(
            transition: ManTransitions.toBottomRight,
          )),
        ],
      ),
    );
  }

  _createRoutingButton(ManTransition transition) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        child: Text("${transition.transition}"),
        onPressed: () {
          Man.pushNamed(
            'route2/12345/profile',
            transition: transition,
          );
        },
      ),
    );
  }
}
