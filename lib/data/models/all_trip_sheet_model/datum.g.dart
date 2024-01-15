// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      tripSheetName: json['trip_sheet_name'] as String?,
      tripDate: json['trip_date'] as String?,
      estimateArrivalDate: json['estimate_arrival_date'] as String?,
      tripTime: json['trip_time'] as String?,
      header: json['header'],
      vehicleId: json['vehicle_id'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      vehicleDrivername: json['vehicle_drivername'] as String?,
      vehicleDrivermobilenumber: json['vehicle_drivermobilenumber'] as String?,
      helperName: json['helper_name'] as String?,
      helperMobilenumber: json['helper_mobilenumber'] as String?,
      startKm: json['start_km'] as String?,
      stopKm: json['stop_km'] as String?,
      totalKm: json['total_km'] as String?,
      totalRent: json['total_rent'] as String?,
      expDiesel: json['exp_diesel'] as String?,
      expBatha: json['exp_batha'] as String?,
      expPhone: json['exp_phone'] as String?,
      expToll: json['exp_toll'] as String?,
      expFood: json['exp_food'] as String?,
      expOther: json['exp_other'] as String?,
      expTotal: json['exp_total'] as String?,
      expAdvance: json['exp_advance'] as String?,
      balanceAmt: json['balance_amt'] as String?,
      status: json['status'] as int?,
      destination: json['destination'] as String?,
      uploadFileName: json['upload_file_name'],
      branchId: json['branch_id'] as int?,
      url: json['url'],
      vendorOrVehicle: json['vendor_or_vehicle'] as String?,
      vendorId: json['vendor_id'] as int?,
      vendorName: json['vendor_name'] as String?,
      vendorLocation: json['vendor_location'] as String?,
      mobile: json['mobile'] as String?,
      authorizedPerson: json['authorized_person'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'trip_sheet_name': instance.tripSheetName,
      'trip_date': instance.tripDate,
      'estimate_arrival_date': instance.estimateArrivalDate,
      'trip_time': instance.tripTime,
      'header': instance.header,
      'vehicle_id': instance.vehicleId,
      'vehicle_number': instance.vehicleNumber,
      'vehicle_drivername': instance.vehicleDrivername,
      'vehicle_drivermobilenumber': instance.vehicleDrivermobilenumber,
      'helper_name': instance.helperName,
      'helper_mobilenumber': instance.helperMobilenumber,
      'start_km': instance.startKm,
      'stop_km': instance.stopKm,
      'total_km': instance.totalKm,
      'total_rent': instance.totalRent,
      'exp_diesel': instance.expDiesel,
      'exp_batha': instance.expBatha,
      'exp_phone': instance.expPhone,
      'exp_toll': instance.expToll,
      'exp_food': instance.expFood,
      'exp_other': instance.expOther,
      'exp_total': instance.expTotal,
      'exp_advance': instance.expAdvance,
      'balance_amt': instance.balanceAmt,
      'status': instance.status,
      'destination': instance.destination,
      'upload_file_name': instance.uploadFileName,
      'branch_id': instance.branchId,
      'url': instance.url,
      'vendor_or_vehicle': instance.vendorOrVehicle,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
      'vendor_location': instance.vendorLocation,
      'mobile': instance.mobile,
      'authorized_person': instance.authorizedPerson,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt,
    };
