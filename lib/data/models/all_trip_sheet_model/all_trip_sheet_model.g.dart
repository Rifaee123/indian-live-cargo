// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_trip_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTripSheetModel _$AllTripSheetModelFromJson(Map<String, dynamic> json) =>
    AllTripSheetModel(
      success: json['success'] as String?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllTripSheetModelToJson(AllTripSheetModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'data': instance.data,
    };
