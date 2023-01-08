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
