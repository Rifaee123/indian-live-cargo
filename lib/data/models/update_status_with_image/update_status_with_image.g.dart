// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_with_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusWithImage _$UpdateStatusWithImageFromJson(
        Map<String, dynamic> json) =>
    UpdateStatusWithImage(
      success: json['success'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateStatusWithImageToJson(
        UpdateStatusWithImage instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
