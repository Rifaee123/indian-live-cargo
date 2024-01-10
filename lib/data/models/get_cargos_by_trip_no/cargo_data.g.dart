// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cargo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CargoData _$CargoDataFromJson(Map<String, dynamic> json) => CargoData(
      id: json['id'] as int?,
      goodsId: json['goods_id'] as int?,
      tripNo: json['trip_no'] as String?,
      sortOrder: json['sort_order'] as int?,
      tripSheetId: json['trip_sheet_id'] as int?,
      invoiceNumber: json['invoice_number'] as String?,
      trackingNo: json['tracking_no'] as String?,
      estimateArrivalDate: json['estimate_arrival_date'],
      cargoId: json['cargo_id'] as String?,
      cargoName: json['cargo_name'] as String?,
      place: json['place'] as String?,
      address: json['address'] as String?,
      shipmentName: json['shipment_name'] as String?,
      lrNo: json['lr_no'] as String?,
      trackingUrl: json['tracking_url'] as String?,
      mobilenumber: json['mobilenumber'] as String?,
      quantity: json['quantity'] as int?,
      weight: json['weight'] as String?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      branchId: json['branch_id'] as int?,
      currentStatusId: json['current_status_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CargoDataToJson(CargoData instance) => <String, dynamic>{
      'id': instance.id,
      'goods_id': instance.goodsId,
      'trip_no': instance.tripNo,
      'sort_order': instance.sortOrder,
      'trip_sheet_id': instance.tripSheetId,
      'invoice_number': instance.invoiceNumber,
      'tracking_no': instance.trackingNo,
      'estimate_arrival_date': instance.estimateArrivalDate,
      'cargo_id': instance.cargoId,
      'cargo_name': instance.cargoName,
      'place': instance.place,
      'address': instance.address,
      'shipment_name': instance.shipmentName,
      'lr_no': instance.lrNo,
      'tracking_url': instance.trackingUrl,
      'mobilenumber': instance.mobilenumber,
      'quantity': instance.quantity,
      'weight': instance.weight,
      'status': instance.status,
      'message': instance.message,
      'branch_id': instance.branchId,
      'current_status_id': instance.currentStatusId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
