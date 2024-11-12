import 'package:json_annotation/json_annotation.dart';
part 'accessories_model.g.dart';

@JsonSerializable()
class Accessories {
  String? uName;
  String? billImg;
  String? vehicleName;
  String? accessoryName;
  String? buyedOn;
  String? buyedFrom;
  String? transType;
  double? price;

  Accessories({
    required this.uName,
    required this.billImg,
    required this.vehicleName,
    required this.accessoryName,
    required this.buyedOn,
    required this.buyedFrom,
    required this.transType,
    required this.price,
  });

  factory Accessories.fromJson(Map<String, dynamic> json) =>
      _$AccessoriesFromJson(json);

  Map<String, dynamic> toJson() => _$AccessoriesToJson(this);
}
