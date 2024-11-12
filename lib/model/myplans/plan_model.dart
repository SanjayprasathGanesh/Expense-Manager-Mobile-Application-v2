import 'package:json_annotation/json_annotation.dart';
part 'plan_model.g.dart';

@JsonSerializable()
class Plans {
  String? uName;
  String? planName;
  int? budget;
  int? ttlExp;
  String? fromDate;
  String? toDate;

  Plans({
    required this.uName,
    required this.planName,
    required this.budget,
    required this.ttlExp,
    required this.fromDate,
    required this.toDate,
  });

  factory Plans.fromJson(Map<String, dynamic> json) => _$PlansFromJson(json);

  Map<String, dynamic> toJson() => _$PlansToJson(this);
}
