import 'package:json_annotation/json_annotation.dart';
part 'plan_exp_model.g.dart';

@JsonSerializable()
class PlanExpense {
  String? uName;
  String? planName;
  String? planExpenseImg;
  String? planExpenseName;
  String? planExpenseDate;
  int? planExpenseAmt;
  String? planExpenseType;
  String? planExpenseTrans;
  String? month;

  PlanExpense({
    required this.uName,
    required this.planName,
    required this.planExpenseImg,
    required this.planExpenseName,
    required this.planExpenseDate,
    required this.planExpenseAmt,
    required this.planExpenseType,
    required this.planExpenseTrans,
    required this.month,
  });

  factory PlanExpense.fromJson(Map<String, dynamic> json) =>
      _$PlanExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanExpenseToJson(this);
}
