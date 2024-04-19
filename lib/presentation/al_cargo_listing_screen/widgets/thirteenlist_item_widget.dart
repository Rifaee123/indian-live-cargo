import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';

class ThirteenlistItemWidget extends StatefulWidget {
  final CargoData cargoData;
  final Function(bool isSelected) onSelectionChanged;
  final Map<int, Color> colorMap;
  final Map<int, String> statusMap;

  ThirteenlistItemWidget({
    required this.cargoData,
    required this.onSelectionChanged,
    Key? key,
    required this.colorMap,
    required this.statusMap,
  }) : super(key: key);

  @override
  _ThirteenlistItemWidgetState createState() => _ThirteenlistItemWidgetState();
}

class _ThirteenlistItemWidgetState extends State<ThirteenlistItemWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 17.0,
      ),
      decoration: BoxDecoration(
        color: widget.colorMap[widget.cargoData.status],
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                isSelected = value!;
                widget.onSelectionChanged(isSelected);
              });
            },
          ),
          Container(
            width: 80.h,
            child: Text(
              widget.cargoData.invoiceNumber.toString(),
              style: theme.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.0,
              right: 4.0,
              bottom: 3.0,
            ),
            child: Text(
              widget.statusMap[widget.cargoData.status]
                  .toString()
                  .toUpperCase(),
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
