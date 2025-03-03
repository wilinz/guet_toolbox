import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_image.g.dart';

@autoequal
@JsonSerializable(explicitToJson: true)
class BackgroundImageInfo with EquatableMixin {

  @JsonKey(name: "path", defaultValue: "")
  String path;

  @ignore
  @JsonKey(name: "enable", defaultValue: false)
  bool enable;

  BackgroundImageInfo({required this.path, required this.enable});

  factory BackgroundImageInfo.fromJson(Map<String, dynamic> json) => _$BackgroundImageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundImageInfoToJson(this);

  factory BackgroundImageInfo.emptyInstance() => BackgroundImageInfo(path: "",enable: false);

  @override
  List<Object?> get props => _$props;

}