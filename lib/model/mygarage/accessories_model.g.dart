// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accessories _$AccessoriesFromJson(Map<String, dynamic> json) => Accessories(
      uName: json['uName'] as String?,
      billImg: json['billImg'] as String?,
      vehicleName: json['vehicleName'] as String?,
      accessoryName: json['accessoryName'] as String?,
      buyedOn: json['buyedOn'] as String?,
      buyedFrom: json['buyedFrom'] as String?,
      transType: json['transType'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccessoriesToJson(Accessories instance) =>
    <String, dynamic>{
      'uName': instance.uName,
      'billImg': instance.billImg,
      'vehicleName': instance.vehicleName,
      'accessoryName': instance.accessoryName,
      'buyedOn': instance.buyedOn,
      'buyedFrom': instance.buyedFrom,
      'transType': instance.transType,
      'price': instance.price,
    };
