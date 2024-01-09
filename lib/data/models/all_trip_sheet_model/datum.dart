import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'trip_number')
  int? tripNumber;
  @JsonKey(name: 'vehicle_drivername')
  String? vehicleDrivername;
  @JsonKey(name: 'trip_date')
  String? tripDate;
  @JsonKey(name: 'vehicle_number')
  String? vehicleNumber;

  Datum({
    this.tripNumber,
    this.vehicleDrivername,
    this.tripDate,
    this.vehicleNumber,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
