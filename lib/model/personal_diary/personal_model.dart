import 'package:json_annotation/json_annotation.dart';
part 'personal_model.g.dart';

@JsonSerializable()
class PersonalDiary {
  String? uName;
  String? date;
  String? month;
  String? sub;
  String? content;
  double? rating;

  PersonalDiary({
    required this.uName,
    required this.date,
    required this.month,
    required this.sub,
    required this.content,
    required this.rating,
  });

  factory PersonalDiary.fromJson(Map<String, dynamic> map) =>
      _$PersonalDiaryFromJson(map);

  Map<String, dynamic> toJson() => _$PersonalDiaryToJson(this);
}
