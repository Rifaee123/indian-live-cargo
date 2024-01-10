import 'package:json_annotation/json_annotation.dart';

import 'cargo_data.dart';

part 'get_cargos_by_trip_no.g.dart';

@JsonSerializable()
class GetCargosByTripNo {
  String? success;
  String? status;
  List<CargoData>? data;

  GetCargosByTripNo({this.success, this.status, this.data});

  factory GetCargosByTripNo.fromJson(Map<String, dynamic> json) {
    return _$GetCargosByTripNoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCargosByTripNoToJson(this);
}
