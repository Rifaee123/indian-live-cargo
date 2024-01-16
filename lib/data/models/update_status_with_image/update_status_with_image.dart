import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_status_with_image.g.dart';

@JsonSerializable()
class UpdateStatusWithImage {
  String? success;
  String? status;
  String? message;
  Data? data;

  UpdateStatusWithImage({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory UpdateStatusWithImage.fromJson(Map<String, dynamic> json) {
    return _$UpdateStatusWithImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateStatusWithImageToJson(this);
}
