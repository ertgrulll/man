import '../typedefs.dart';

/// General updater.
class Dispatcher {
  factory Dispatcher() => _manager;
  Dispatcher._();
  static final Dispatcher _manager = Dispatcher._();

  final _listeners = <ManDispatch>[];

  void addListener(ManDispatch callback) {
    _listeners.add(callback);
  }

  void dispatch() {
    for (final listener in _listeners) {
      listener(true);
    }
  }

  bool removeListener(ManDispatch callback) {
    return _listeners.remove(callback);
  }
}
