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
  late ManDispatch updateCallback;

  @override
  void initState() {
    updateCallback = (isOuter) {
      // Widget is not on screen, no need to update.
      if (!mounted) return;

      // Not binded to a managed.
      if (widget.bindings.isEmpty) {
        setState(() {});
      }

      // Binded to a managed
      else {
        // It's a general update. Not related with this Man.
        if (isOuter) return;

        setState(() {});
      }
    };

    if (widget.bindings.isNotEmpty) {
      for (final Managed binding in widget.bindings) {
        binding.addListener(updateCallback);
      }
    } else {
      Dispatcher().addListener(updateCallback);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.bindings.isNotEmpty) {
      for (final binding in widget.bindings) {
        binding.removeListener(updateCallback);
      }
    } else {
      Dispatcher().removeListener(updateCallback);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }
}
