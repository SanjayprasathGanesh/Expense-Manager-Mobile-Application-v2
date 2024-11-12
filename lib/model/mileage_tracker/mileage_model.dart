import 'package:json_annotation/json_annotation.dart';
part 'mileage_model.g.dart';

@JsonSerializable()
class Mileage {
  String? uName;
  String? date;
  String? startKm;
  String? endKm;
  double? ttlLitres;
  double? price;
  String? ttlDistance;
  String? mileage;

  Mileage({
    required this.uName,
    required this.date,
    required this.startKm,
    required this.endKm,
    required this.ttlLitres,
    required this.price,
    required this.ttlDistance,
    required this.mileage,
  });

  factory Mileage.fromJson(Map<String, dynamic> json) =>
      _$MileageFromJson(json);

  Map<String, dynamic> toJson() => _$MileageToJson(this);
}
