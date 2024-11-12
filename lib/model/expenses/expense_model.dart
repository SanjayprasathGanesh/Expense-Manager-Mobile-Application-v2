import 'package:json_annotation/json_annotation.dart';
part 'expense_model.g.dart';

@JsonSerializable()
class Expense {
  String? uName;
  String? expenseImg;
  String? expenseName;
  String? expenseDate;
  int? expenseAmt;
  String? expenseType;
  String? expenseTrans;
  String? month;

  Expense({
    required this.uName,
    required this.expenseImg,
    required this.expenseName,
    required this.expenseDate,
    required this.expenseAmt,
    required this.expenseType,
    required this.expenseTrans,
    required this.month,
  });

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
