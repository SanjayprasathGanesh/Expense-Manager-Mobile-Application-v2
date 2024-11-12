// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mileage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mileage _$MileageFromJson(Map<String, dynamic> json) => Mileage(
      uName: json['uName'] as String?,
      date: json['date'] as String?,
      startKm: json['startKm'] as String?,
      endKm: json['endKm'] as String?,
      ttlLitres: (json['ttlLitres'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      ttlDistance: json['ttlDistance'] as String?,
      mileage: json['mileage'] as String?,
    );

Map<String, dynamic> _$MileageToJson(Mileage instance) => <String, dynamic>{
      'uName': instance.uName,
      'date': instance.date,
      'startKm': instance.startKm,
      'endKm': instance.endKm,
      'ttlLitres': instance.ttlLitres,
      'price': instance.price,
      'ttlDistance': instance.ttlDistance,
      'mileage': instance.mileage,
    };
