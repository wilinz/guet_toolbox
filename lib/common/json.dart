extension IterableToJsonExtension on Iterable {
  List<Map<String, dynamic>> toJson() =>
      this.map((e) => e.toJson() as Map<String, dynamic>).toList();
}