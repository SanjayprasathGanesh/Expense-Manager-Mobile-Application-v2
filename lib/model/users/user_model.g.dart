// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uName: json['uName'] as String?,
      psw: json['psw'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      marital_status: json['marital_status'] as String?,
      user_type: json['user_type'] as String?,
      user_img: json['user_img'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uName': instance.uName,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob,
      'age': instance.age,
      'gender': instance.gender,
      'marital_status': instance.marital_status,
      'user_type': instance.user_type,
      'psw': instance.psw,
      'user_img': instance.user_img,
    };
