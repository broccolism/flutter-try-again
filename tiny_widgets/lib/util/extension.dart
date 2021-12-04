extension MyList<T> on List<T> {
  /// map 함수에서 index를 사용할 수 있습니다.
  /// ```dart
  /// arr.map(value, index) => ...
  /// ```
  List<R> mapWithIndex<R>(R Function(T value, int index) callback) =>
      List<R>.generate(this.length, (int i) => callback(this[i], i));

  Iterable<R> mapWithIndexIterable<R>(R Function(T, int i) callback) =>
      this.asMap().keys.toList().map((index) => callback(this[index], index));
}
