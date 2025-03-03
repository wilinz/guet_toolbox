import 'package:json_annotation/json_annotation.dart';

part 'exam_scores_sort.g.dart';

List<ExamScoresSort> examScoresSortListFormJson(List json) => json
    .map((e) => ExamScoresSort.fromJson(e as Map<String, dynamic>))
    .toList();

@JsonSerializable(explicitToJson: true)
class ExamScoresSort {
  ExamScoresSort({required this.property, required this.direction});

  @JsonKey(name: "property", defaultValue: "")
  String property;

  @JsonKey(name: "direction", defaultValue: "")
  String direction;

  factory ExamScoresSort.fromJson(Map<String, dynamic> json) =>
      _$ExamScoresSortFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoresSortToJson(this);
}
