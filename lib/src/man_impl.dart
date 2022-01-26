import 'package:flutter/material.dart';
import 'package:man/src/navigation/navigator.dart';
import 'package:man/src/state_manager/man_builder.dart';
import 'package:man/src/state_manager/managed/managed.dart';
import 'package:man/src/state_manager/typedefs.dart';

class Man {
  Man();

  @protected
  ManBuilder call({required ManagedBuilder builder, List<Managed>? bindings}) =>
      ManBuilder(builder, bindings);

  final _navigator = ManNavigator();

  ManNavigator get navigator => _navigator;
}
