import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  @JsonKey(name: 'trip_sheet_name')
  String? tripSheetName;
  @JsonKey(name: 'trip_date')
  String? tripDate;
  @JsonKey(name: 'estimate_arrival_date')
  String? estimateArrivalDate;
  @JsonKey(name: 'trip_time')
  String? tripTime;
  dynamic header;
  @JsonKey(name: 'vehicle_id')
  String? vehicleId;
  @JsonKey(name: 'vehicle_number')
  String? vehicleNumber;
  @JsonKey(name: 'vehicle_drivername')
  String? vehicleDrivername;
  @JsonKey(name: 'vehicle_drivermobilenumber')
  String? vehicleDrivermobilenumber;
  @JsonKey(name: 'helper_name')
  String? helperName;
  @JsonKey(name: 'helper_mobilenumber')
  String? helperMobilenumber;
  @JsonKey(name: 'start_km')
  String? startKm;
  @JsonKey(name: 'stop_km')
  String? stopKm;
  @JsonKey(name: 'total_km')
  String? totalKm;
  @JsonKey(name: 'total_rent')
  String? totalRent;
  @JsonKey(name: 'exp_diesel')
  String? expDiesel;
  @JsonKey(name: 'exp_batha')
  String? expBatha;
  @JsonKey(name: 'exp_phone')
  String? expPhone;
  @JsonKey(name: 'exp_toll')
  String? expToll;
  @JsonKey(name: 'exp_food')
  String? expFood;
  @JsonKey(name: 'exp_other')
  String? expOther;
  @JsonKey(name: 'exp_total')
  String? expTotal;
  @JsonKey(name: 'exp_advance')
  String? expAdvance;
  @JsonKey(name: 'balance_amt')
  String? balanceAmt;
  int? status;
  String? destination;
  @JsonKey(name: 'upload_file_name')
  dynamic uploadFileName;
  @JsonKey(name: 'branch_id')
  int? branchId;
  dynamic url;
  @JsonKey(name: 'vendor_or_vehicle')
  String? vendorOrVehicle;
  @JsonKey(name: 'vendor_id')
  int? vendorId;
  @JsonKey(name: 'vendor_name')
  String? vendorName;
  @JsonKey(name: 'vendor_location')
  String? vendorLocation;
  String? mobile;
  @JsonKey(name: 'authorized_person')
  String? authorizedPerson;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Datum({
    this.id,
    this.tripSheetName,
    this.tripDate,
    this.estimateArrivalDate,
    this.tripTime,
    this.header,
    this.vehicleId,
    this.vehicleNumber,
    this.vehicleDrivername,
    this.vehicleDrivermobilenumber,
    this.helperName,
    this.helperMobilenumber,
    this.startKm,
    this.stopKm,
    this.totalKm,
    this.totalRent,
    this.expDiesel,
    this.expBatha,
    this.expPhone,
    this.expToll,
    this.expFood,
    this.expOther,
    this.expTotal,
    this.expAdvance,
    this.balanceAmt,
    this.status,
    this.destination,
    this.uploadFileName,
    this.branchId,
    this.url,
    this.vendorOrVehicle,
    this.vendorId,
    this.vendorName,
    this.vendorLocation,
    this.mobile,
    this.authorizedPerson,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
