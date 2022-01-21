import 'package:flutter/material.dart';

import 'man.dart';
import 'managed/dispatcher.dart';
import 'managed/managed.dart';
import 'managed/managed_imp.dart';
import 'typedefs.dart';

class ManImpl extends StatefulWidget implements Man {
  const ManImpl(this.builder, {List<Managed>? bindings, Key? key})
      : bindings = bindings ?? const [],
        super(key: key);

  @override
  _ManImplState createState() => _ManImplState();

  final ManagedBuilder builder;
  final List<Managed> bindings;
}

class _ManImplState extends State<ManImpl> {
  late ManDispatch updateCallback;

  @override
  initState() {
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
        (binding as ManagedImpl);
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
