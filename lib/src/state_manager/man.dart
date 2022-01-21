import 'package:flutter/material.dart';

import 'man_impl.dart';
import 'managed/managed.dart';
import 'typedefs.dart';

abstract class Man extends Widget {
  const factory Man(ManagedBuilder builder, {List<Managed>? bindings}) =
      ManImpl;
}
