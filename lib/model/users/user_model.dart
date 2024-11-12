import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? uName;
  String? name;
  String? email;
  String? phone;
  String? dob;
  int? age;
  String? gender;
  String? marital_status;
  String? user_type;
  String? psw;
  String? user_img;

  User({
    required this.uName,
    required this.psw,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.age,
    required this.gender,
    required this.marital_status,
    required this.user_type,
    required this.user_img,
  });

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
