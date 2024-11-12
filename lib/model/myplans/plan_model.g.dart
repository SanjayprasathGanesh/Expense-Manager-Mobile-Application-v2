// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plans _$PlansFromJson(Map<String, dynamic> json) => Plans(
      uName: json['uName'] as String?,
      planName: json['planName'] as String?,
      budget: json['budget'] as int?,
      ttlExp: json['ttlExp'] as int?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$PlansToJson(Plans instance) => <String, dynamic>{
      'uName': instance.uName,
      'planName': instance.planName,
      'budget': instance.budget,
      'ttlExp': instance.ttlExp,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
    };
