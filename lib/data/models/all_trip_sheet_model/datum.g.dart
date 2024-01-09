// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      tripNumber: json['trip_number'] as int?,
      vehicleDrivername: json['vehicle_drivername'] as String?,
      tripDate: json['trip_date'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'trip_number': instance.tripNumber,
      'vehicle_drivername': instance.vehicleDrivername,
      'trip_date': instance.tripDate,
      'vehicle_number': instance.vehicleNumber,
    };
