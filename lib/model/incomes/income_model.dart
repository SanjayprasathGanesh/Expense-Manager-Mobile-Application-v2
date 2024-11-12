import 'package:json_annotation/json_annotation.dart';
part 'income_model.g.dart';

@JsonSerializable()
class Incomes {
  String? uName;
  String? incomeName;
  String? incomeDate;
  int? incomeAmt;
  String? incomeType;
  String? incomeTrans;
  String? month;

  Incomes({
    required this.uName,
    required this.incomeName,
    required this.incomeDate,
    required this.incomeAmt,
    required this.incomeType,
    required this.incomeTrans,
    required this.month,
  });

  factory Incomes.fromJson(Map<String, dynamic> json) =>
      _$IncomesFromJson(json);

  Map<String, dynamic> toJson() => _$IncomesToJson(this);
}
