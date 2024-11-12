// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      uName: json['uName'] as String?,
      vehicleName: json['vehicleName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleImg: json['vehicleImg'] as String?,
      buyedOn: json['buyedOn'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'uName': instance.uName,
      'vehicleName': instance.vehicleName,
      'vehicleType': instance.vehicleType,
      'vehicleImg': instance.vehicleImg,
      'buyedOn': instance.buyedOn,
      'price': instance.price,
    };
