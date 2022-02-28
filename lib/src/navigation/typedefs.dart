import 'package:flutter/material.dart';

/// 'users/:userID/:articleID': (params) => HomePage(params[0], params[1]),
typedef NamedRouteBuilder = Widget Function(List<Object> params);
