import 'package:man/src/state_manager/managed/dispatcher.dart';
import 'package:man/src/state_manager/managed/managed.dart';
import 'package:man/src/state_manager/typedefs.dart';

class ManagedImpl<T> implements Managed<T> {
  ManagedImpl(this._value);

  final _listeners = <ManDispatch>[];

  T _value;

  @override
  T get value => _value;

  @override
  set value(T newVal) {
    if (_value != newVal) {
      _value = newVal;
      notifyListeners();
    }
  }

  @override
  void addListener(ManDispatch callback) {
    _listeners.add(callback);
  }

  @override
  void notifyListeners() {
    for (final listener in _listeners) {
      listener(false);
    }

    Dispatcher().dispatch();
  }

  @override
  void removeListener(ManDispatch callback) {
    _listeners.remove(callback);
  }

  @override
  bool get hasListeners => _listeners.isNotEmpty;

  @override
  void dispose() {}
}
