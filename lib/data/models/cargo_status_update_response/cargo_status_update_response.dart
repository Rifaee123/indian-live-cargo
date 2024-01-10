import 'package:json_annotation/json_annotation.dart';

part 'cargo_status_update_response.g.dart';

@JsonSerializable()
class CargoStatusUpdateResponse {
  String? success;
  String? status;
  String? message;
  List<dynamic>? data;

  CargoStatusUpdateResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory CargoStatusUpdateResponse.fromJson(Map<String, dynamic> json) {
    return _$CargoStatusUpdateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CargoStatusUpdateResponseToJson(this);
}
