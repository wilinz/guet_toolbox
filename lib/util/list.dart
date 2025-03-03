extension ListExtension<E> on Iterable<E> {
  E? firstOrNull() {
    try {
      return first;
    } catch (e) {}
    return null;
  }

  E? firstWhereOrNull(bool test(E element), {E orElse()?}) {
    try {
      return firstWhere(test, orElse: orElse);
    } catch (e) {}
    return null;
  }

  E? lastWhereOrNull(bool test(E element), {E orElse()?}) {
    try {
      return lastWhere(test, orElse: orElse);
    } catch (e) {}
    return null;
  }

  Map<K, List<E>> groupBy<K>(K Function(E) key) {
    var map = <K, List<E>>{};
    for (E item in this) {
      var keyValue = key(item);
      if (!map.containsKey(keyValue)) {
        map[keyValue] = <E>[];
      }
      map[keyValue]?.add(item);
    }
    return map;
  }

}

extension NumListExtension on Iterable<num> {
  num sum() {
    num sum = 0;
    for (final i in this) {
      sum += i;
    }
    return sum;
  }

  num average() => this.sum() / this.length;
}

extension ListExtensions<T> on List<T> {
  T? getOrNull(int index) {
    if (index >= 0 && index < this.length) {
      return this[index];
    }
    return null;
  }
}


