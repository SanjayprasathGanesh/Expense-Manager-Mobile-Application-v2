import 'package:json_annotation/json_annotation.dart';
part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUs {
  String? uName;
  String? date;
  String? emailId;
  String? subject;
  String? content;

  ContactUs({
    required this.uName,
    required this.date,
    required this.emailId,
    required this.subject,
    required this.content,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) =>
      _$ContactUsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsToJson(this);
}
