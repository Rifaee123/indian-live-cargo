import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';

class ThirteenlistItemWidget extends StatefulWidget {
  final CargoData cargoData;
  final Function(bool isSelected) onSelectionChanged;

  ThirteenlistItemWidget({
    required this.cargoData,
    required this.onSelectionChanged,
    Key? key,
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
      decoration: AppDecoration.fillBlue.copyWith(
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
          Text(
            widget.cargoData.invoiceNumber.toString(),
            style: theme.textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.0,
              right: 4.0,
              bottom: 3.0,
            ),
            child: Text(
              "Out For Delivery",
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
