// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_exp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanExpense _$PlanExpenseFromJson(Map<String, dynamic> json) => PlanExpense(
      uName: json['uName'] as String?,
      planName: json['planName'] as String?,
      planExpenseImg: json['planExpenseImg'] as String?,
      planExpenseName: json['planExpenseName'] as String?,
      planExpenseDate: json['planExpenseDate'] as String?,
      planExpenseAmt: json['planExpenseAmt'] as int?,
      planExpenseType: json['planExpenseType'] as String?,
      planExpenseTrans: json['planExpenseTrans'] as String?,
      month: json['month'] as String?,
    );

Map<String, dynamic> _$PlanExpenseToJson(PlanExpense instance) =>
    <String, dynamic>{
      'uName': instance.uName,
      'planName': instance.planName,
      'planExpenseImg': instance.planExpenseImg,
      'planExpenseName': instance.planExpenseName,
      'planExpenseDate': instance.planExpenseDate,
      'planExpenseAmt': instance.planExpenseAmt,
      'planExpenseType': instance.planExpenseType,
      'planExpenseTrans': instance.planExpenseTrans,
      'month': instance.month,
    };
