// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalDiary _$PersonalDiaryFromJson(Map<String, dynamic> json) =>
    PersonalDiary(
      uName: json['uName'] as String?,
      date: json['date'] as String?,
      month: json['month'] as String?,
      sub: json['sub'] as String?,
      content: json['content'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PersonalDiaryToJson(PersonalDiary instance) =>
    <String, dynamic>{
      'uName': instance.uName,
      'date': instance.date,
      'month': instance.month,
      'sub': instance.sub,
      'content': instance.content,
      'rating': instance.rating,
    };
