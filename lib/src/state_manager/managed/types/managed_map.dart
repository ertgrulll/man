import 'package:man/src/state_manager/managed/managed_imp.dart';

class ManagedMap<K, V> extends ManagedImpl<Map<K, V>> implements Map<K, V> {
  ManagedMap(Map<K, V> _value) : super(_value);

  @override
  V? operator [](Object? key) => value[key];

  @override
  void operator []=(K key, V value) {
    this.value[key] = value;
    notify();
  }

  @override
  void addAll(Map<K, V> other) {
    value.addAll(other);
    notify();
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    value.addEntries(newEntries);
    notify();
  }

  @override
  Map<RK, RV> cast<RK, RV>() => value.cast<RK, RV>();

  @override
  void clear() {
    value.clear();
    notify();
  }

  @override
  bool containsKey(Object? key) => value.containsKey(key);

  @override
  bool containsValue(Object? value) => this.value.containsValue(value);

  @override
  Iterable<MapEntry<K, V>> get entries => value.entries;

  @override
  void forEach(void Function(K key, V value) action) => value.forEach(action);

  @override
  bool get isEmpty => value.isEmpty;

  @override
  bool get isNotEmpty => value.isNotEmpty;

  @override
  Iterable<K> get keys => value.keys;

  @override
  int get length => value.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) =>
      value.map(convert);

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    if (value.containsKey(key)) {
      return value[key]!;
    } else {
      value[key] = ifAbsent();

      notify();
      return value[key]!;
    }
  }

  @override
  V? remove(Object? key) {
    if (value.containsKey(key)) {
      final result = value.remove(key);
      notify();

      return result;
    } else {
      return null;
    }
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    value.removeWhere(test);
    notify();
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    value.updateAll(update);
    notify();
  }

  @override
  Iterable<V> get values => value.values;

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    final result = value.update(key, update, ifAbsent: ifAbsent);
    notify();

    return result;
  }
}
