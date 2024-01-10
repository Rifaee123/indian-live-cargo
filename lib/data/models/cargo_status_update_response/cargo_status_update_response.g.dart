// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cargo_status_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CargoStatusUpdateResponse _$CargoStatusUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    CargoStatusUpdateResponse(
      success: json['success'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$CargoStatusUpdateResponseToJson(
        CargoStatusUpdateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
