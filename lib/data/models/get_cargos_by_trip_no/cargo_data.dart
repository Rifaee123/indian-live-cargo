import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cargo_data.g.dart';

@JsonSerializable()
class CargoData {
  int? id;
  @JsonKey(name: 'goods_id')
  int? goodsId;
  @JsonKey(name: 'trip_no')
  String? tripNo;
  @JsonKey(name: 'sort_order')
  int? sortOrder;
  @JsonKey(name: 'trip_sheet_id')
  int? tripSheetId;
  @JsonKey(name: 'invoice_number')
  String? invoiceNumber;
  @JsonKey(name: 'tracking_no')
  String? trackingNo;
  @JsonKey(name: 'estimate_arrival_date')
  dynamic estimateArrivalDate;
  @JsonKey(name: 'cargo_id')
  String? cargoId;
  @JsonKey(name: 'cargo_name')
  String? cargoName;
  String? place;
  String? address;
  @JsonKey(name: 'shipment_name')
  String? shipmentName;
  @JsonKey(name: 'lr_no')
  String? lrNo;
  @JsonKey(name: 'tracking_url')
  String? trackingUrl;
  @JsonKey(name: 'filename')
  String? imageUrl;
  String? mobilenumber;
  int? quantity;
  String? weight;
  int? status;
  String? message;
  @JsonKey(name: 'branch_id')
  int? branchId;
  @JsonKey(name: 'current_status_id')
  int? currentStatusId;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  RxBool isSelected=false.obs;

  CargoData(
      {this.id,
      this.goodsId,
      this.tripNo,
      this.sortOrder,
      this.tripSheetId,
      this.invoiceNumber,
      this.trackingNo,
      this.estimateArrivalDate,
      this.cargoId,
      this.cargoName,
      this.place,
      this.address,
      this.shipmentName,
      this.lrNo,
      this.trackingUrl,
      this.imageUrl,
      this.mobilenumber,
      this.quantity,
      this.weight,
      this.status,
      this.message,
      this.branchId,
      this.currentStatusId,
      this.createdAt,
      this.updatedAt,
       required this.isSelected});

  factory CargoData.fromJson(Map<String, dynamic> json) =>
      _$CargoDataFromJson(json);

  Map<String, dynamic> toJson() => _$CargoDataToJson(this);
}
