import 'package:json_annotation/json_annotation.dart';
part 'vehicle_model.g.dart';

@JsonSerializable()
class Vehicle {
  String? uName;
  String? vehicleName;
  String? vehicleType;
  String? vehicleImg;
  String? buyedOn;
  double? price;

  Vehicle({
    required this.uName,
    required this.vehicleName,
    required this.vehicleType,
    required this.vehicleImg,
    required this.buyedOn,
    required this.price,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
