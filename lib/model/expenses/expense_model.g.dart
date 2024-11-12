// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      uName: json['uName'] as String?,
      expenseImg: json['expenseImg'] as String?,
      expenseName: json['expenseName'] as String?,
      expenseDate: json['expenseDate'] as String?,
      expenseAmt: json['expenseAmt'] as int?,
      expenseType: json['expenseType'] as String?,
      expenseTrans: json['expenseTrans'] as String?,
      month: json['month'] as String?,
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'uName': instance.uName,
      'expenseImg': instance.expenseImg,
      'expenseName': instance.expenseName,
      'expenseDate': instance.expenseDate,
      'expenseAmt': instance.expenseAmt,
      'expenseType': instance.expenseType,
      'expenseTrans': instance.expenseTrans,
      'month': instance.month,
    };
