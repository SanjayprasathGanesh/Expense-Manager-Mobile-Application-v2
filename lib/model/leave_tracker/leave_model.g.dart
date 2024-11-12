// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Leave _$LeaveFromJson(Map<String, dynamic> json) => Leave(
      uName: json['uName'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      month: json['month'] as String?,
      leaveType: json['leaveType'] as String?,
      reason: json['reason'] as String?,
      ttlDays: json['ttlDays'] as int?,
    );

Map<String, dynamic> _$LeaveToJson(Leave instance) => <String, dynamic>{
      'uName': instance.uName,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'month': instance.month,
      'leaveType': instance.leaveType,
      'reason': instance.reason,
      'ttlDays': instance.ttlDays,
    };
