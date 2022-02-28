import 'dart:math';

import 'package:man/src/state_manager/managed/managed_imp.dart';

class ManagedList<E> extends ManagedImpl<List<E>> implements List<E> {
  ManagedList(List<E> _value) : super(_value);

  @override
  bool any(bool Function(E element) test) => value.any(test);

  @override
  bool contains(Object? element) => value.contains(element);

  @override
  E elementAt(int index) => value.elementAt(index);

  @override
  bool every(bool Function(E element) test) => value.every(test);

  @override
  E get first => value.first;

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    return value.firstWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) => value.followedBy(other);

  @override
  void forEach(void Function(E element) action) => value.forEach(action);

  @override
  bool get isEmpty => value.isEmpty;

  @override
  bool get isNotEmpty => value.isNotEmpty;

  @override
  Iterator<E> get iterator => value.iterator;

  @override
  String join([String separator = ""]) => value.join(separator);

  @override
  E get last => value.last;

  @override
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) =>
      value.lastWhere(test, orElse: orElse);

  @override
  int get length => value.length;

  @override
  E reduce(E Function(E value, E element) combine) => value.reduce(combine);

  @override
  E get single => value.single;

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) =>
      value.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int count) => value.skip(count);

  @override
  Iterable<E> skipWhile(bool Function(E value) test) => value.skipWhile(test);

  @override
  Iterable<E> take(int count) => value.take(count);

  @override
  Iterable<E> takeWhile(bool Function(E value) test) => value.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) => value.toList(growable: growable);

  @override
  Set<E> toSet() => value.toSet();

  @override
  Iterable<E> where(bool Function(E element) test) => value.where(test);

  @override
  Iterable<T> whereType<T>() => value.whereType<T>();

  @override
  List<E> operator +(List<E> other) => value + other;

  @override
  E operator [](int index) => value[index];

  @override
  void operator []=(int index, E value) {
    this.value[index] = value;
    notify();
  }

  @override
  void add(E value) {
    this.value.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    value.addAll(iterable);
    notify();
  }

  @override
  Map<int, E> asMap() => value.asMap();

  @override
  List<R> cast<R>() => value.cast<R>();

  @override
  void clear() {
    value.clear();
    notify();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    value.fillRange(start, end, fillValue);
    notify();
  }

  @override
  set first(E value) {
    this.value.first = value;
    notify();
  }

  @override
  Iterable<E> getRange(int start, int end) => value.getRange(start, end);

  @override
  int indexOf(E element, [int start = 0]) => value.indexOf(element, start);

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      value.indexWhere(test, start);

  @override
  void insert(int index, E element) {
    value.insert(index, element);
    notify();
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    value.insertAll(index, iterable);
    notify();
  }

  @override
  set last(E value) {
    this.value.last = value;
    notify();
  }

  @override
  int lastIndexOf(E element, [int? start]) => value.lastIndexOf(element, start);

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) =>
      value.lastIndexWhere(test, start);

  @override
  set length(int newLength) {
    value.length = newLength;
    notify();
  }

  @override
  bool remove(Object? value) {
    final bool result = this.value.remove(value);
    if (result) {
      notify();
    }

    return result;
  }

  @override
  E removeAt(int index) {
    final result = value.removeAt(index);
    notify();

    return result;
  }

  @override
  E removeLast() {
    final result = value.removeLast();
    notify();

    return result;
  }

  @override
  void removeRange(int start, int end) {
    value.removeRange(start, end);
    notify();
  }

  @override
  void removeWhere(bool Function(E element) test) {
    value.removeWhere(test);
    notify();
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    value.replaceRange(start, end, replacements);
    notify();
  }

  @override
  void retainWhere(bool Function(E element) test) {
    value.retainWhere(test);
    notify();
  }

  @override
  Iterable<E> get reversed => value.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) {
    value.setAll(index, iterable);
    notify();
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    value.setRange(start, end, iterable, skipCount);
    notify();
  }

  @override
  void shuffle([Random? random]) {
    value.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    value.sort(compare);
    notify();
  }

  @override
  List<E> sublist(int start, [int? end]) => value.sublist(start, end);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      value.fold(initialValue, combine);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) toElements) =>
      value.expand(toElements);

  @override
  Iterable<T> map<T>(T Function(E e) toElement) => value.map(toElement);
}
