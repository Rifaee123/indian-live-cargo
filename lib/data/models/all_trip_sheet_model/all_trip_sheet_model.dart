import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'all_trip_sheet_model.g.dart';

@JsonSerializable()
class AllTripSheetModel {
  String? success;
  String? status;
  List<Datum>? data;

  AllTripSheetModel({this.success, this.status, this.data});

  factory AllTripSheetModel.fromJson(Map<String, dynamic> json) {
    return _$AllTripSheetModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllTripSheetModelToJson(this);
}
