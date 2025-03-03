class ResponseTemplate<T1, T2> {
  ResponseTemplate({
    required this.success,
    required this.total,
    required this.data,
  });

  late final bool success;
  late final int total;
  late final T1 data;

  ResponseTemplate.fromJson(
      Map<String, dynamic> json, dynamic Function(dynamic json) mapData) {
    success = json['success'];
    total = json['total'];
    var dataJson = json['data'];
    if (dataJson is List) {
      data = List.of(dataJson.map((e) => mapData.call(e) as T2)).toList() as T1;
    } else {
      data = mapData.call(dataJson);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['total'] = total;
    if (this.data is List) {
      _data['data'] = (this.data as List).map((e) => e.toJson());
    } else {
      _data['data'] = (this.data as dynamic).toJson();
    }
    return _data;
  }
}
