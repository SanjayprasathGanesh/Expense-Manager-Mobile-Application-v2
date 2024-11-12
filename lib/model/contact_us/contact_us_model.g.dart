// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUs _$ContactUsFromJson(Map<String, dynamic> json) => ContactUs(
      uName: json['uName'] as String?,
      date: json['date'] as String?,
      emailId: json['emailId'] as String?,
      subject: json['subject'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ContactUsToJson(ContactUs instance) => <String, dynamic>{
      'uName': instance.uName,
      'date': instance.date,
      'emailId': instance.emailId,
      'subject': instance.subject,
      'content': instance.content,
    };
