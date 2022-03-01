import 'package:flutter/material.dart';

import 'package:man/src/state_manager/managed/dispatcher.dart';
import 'package:man/src/state_manager/managed/managed.dart';
import 'package:man/src/state_manager/typedefs.dart';

class ManBuilder extends StatefulWidget {
  const ManBuilder(
    this.builder,
    List<Managed>? bindings, [
    Key? key,
  ])  : bindings = bindings ?? const [],
        super(key: key);

  @override
  _ManBuilderState createState() => _ManBuilderState();

  final ManagedBuilder builder;
  final List<Managed> bindings;
}

class _ManBuilderState extends State<ManBuilder> {
  late ManDispatch _updateCallback;
  late Widget _child = widget.builder();

  @override
  void initState() {
    _updateCallback = (isOuter) {
      // Widget is not on screen, no need to update.
      if (!mounted) return;

      // Not binded to a managed.
      if (widget.bindings.isEmpty) {
        setState(() {
          _child = widget.builder();
        });
      } else {
        // Binded to a managed
        // It's a general update. Not related with this Man.
        if (isOuter) return;

        setState(() {
          _child = widget.builder();
        });
      }
    };

    if (widget.bindings.isNotEmpty) {
      for (final Managed binding in widget.bindings) {
        binding.addListener(_updateCallback);
      }
    } else {
      Dispatcher().addListener(_updateCallback);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.bindings.isNotEmpty) {
      for (final binding in widget.bindings) {
        binding.removeListener(_updateCallback);
      }
    } else {
      Dispatcher().removeListener(_updateCallback);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}
