import '../typedefs.dart';
import 'managed_imp.dart';

abstract class Managed<T> {
  /// Creates a managed variable.
  ///
  /// Managed variables automatically updates related widget when it's value
  /// changed.
  factory Managed(T _value) = ManagedImpl<T>;

  /// Returns value of the managed variable.
  T get value;

  /// Updates value of the managed variable and related widget if there are.
  set value(T newVal);

  /// Returns true if any listener registered to this variable.
  bool get hasListeners;

  /// Registers a listener to this variable.
  void addListener(ManDispatch callback);

  /// Unregisters a listener from this variable.
  void removeListener(ManDispatch callback);

  /// Calls registered listeners. This may cause re-rendering.
  ///
  /// This method is called automatically when [value] is changed.
  ///
  /// Usefull for updating related widgets without changing whole variable.
  /// For example, if you have a variable that is a list of items, you can
  /// update only one item in the list without changing the whole list and
  /// trigger a re-render by calling this method.
  void notifyListeners();

  /// Releases all resources used by this variable.
  void dispose();
}

/// A shortcut for creating [Managed] variable.
extension ManagedShortcut<T> on T {
  Managed<T> get man => Managed<T>(this);
}
