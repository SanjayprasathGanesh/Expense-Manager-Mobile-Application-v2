import 'package:json_annotation/json_annotation.dart';
part 'leave_model.g.dart';

@JsonSerializable()
class Leave {
  String? uName;
  String? fromDate;
  String? toDate;
  String? month;
  String? leaveType;
  String? reason;
  int? ttlDays;

  Leave({
    required this.uName,
    required this.fromDate,
    required this.toDate,
    required this.month,
    required this.leaveType,
    required this.reason,
    required this.ttlDays,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveToJson(this);
}
