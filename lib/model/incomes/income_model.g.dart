// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Incomes _$IncomesFromJson(Map<String, dynamic> json) => Incomes(
      uName: json['uName'] as String?,
      incomeName: json['incomeName'] as String?,
      incomeDate: json['incomeDate'] as String?,
      incomeAmt: json['incomeAmt'] as int?,
      incomeType: json['incomeType'] as String?,
      incomeTrans: json['incomeTrans'] as String?,
      month: json['month'] as String?,
    );

Map<String, dynamic> _$IncomesToJson(Incomes instance) => <String, dynamic>{
      'uName': instance.uName,
      'incomeName': instance.incomeName,
      'incomeDate': instance.incomeDate,
      'incomeAmt': instance.incomeAmt,
      'incomeType': instance.incomeType,
      'incomeTrans': instance.incomeTrans,
      'month': instance.month,
    };
