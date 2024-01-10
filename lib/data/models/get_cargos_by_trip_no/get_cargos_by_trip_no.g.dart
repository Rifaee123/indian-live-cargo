// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cargos_by_trip_no.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCargosByTripNo _$GetCargosByTripNoFromJson(Map<String, dynamic> json) =>
    GetCargosByTripNo(
      success: json['success'] as String?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CargoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCargosByTripNoToJson(GetCargosByTripNo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
