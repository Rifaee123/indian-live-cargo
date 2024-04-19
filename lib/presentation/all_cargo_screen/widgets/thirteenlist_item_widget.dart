import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
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
  AllCargoScreenController controller = Get.put(AllCargoScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.colorMap[widget.cargoData.status],
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Checkbox(
              value: widget.cargoData.isSelected.value,
              onChanged: (value) {
                if (value == true) {
                  List<CargoData> similarTrackingItems = [];

                  // Assuming your target tracking number is "11900056"
                  String targetTrackingNumber =
                      widget.cargoData.trackingNo.toString();

                  // Find CargoData items with the same tracking number
                  similarTrackingItems = controller
                      .getcargocontroller.cargoaddedList
                      .where(
                          (cargo) => cargo.trackingNo == targetTrackingNumber)
                      .toList();
                  if (similarTrackingItems.length >= 2) {
                    log(similarTrackingItems.length.toString());
                    Get.defaultDialog(
                      textCancel: "Select",
                      onCancel: () {
                        log("back");
                        similarTrackingItems.forEach((cargo) {
                          controller.selectedCargoItems.add(cargo);
                          controller.addToCargoIds(cargo.id!);

                          cargo.isSelected.value = true;
                        });
                      },
                      title: 'Similar Tracking IDs',
                      content: Column(
                        children: [
                          Text(
                            'Tracking No: ${widget.cargoData.trackingNo}',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                          SizedBox(height: 10),
                          ...similarTrackingItems
                              .map(
                                (item) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Invoice No: ${item.invoiceNumber}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                      ),
                      actions: [
                        SizedBox(
                          height: 35.v,
                          width: 80.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(0),
                                side: MaterialStatePropertyAll(
                                    BorderSide(color: Colors.red)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))))),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'),
                          ),
                        ),
                      ],
                    );
                  }

// Print the similar tracking items
                  similarTrackingItems.forEach((cargo) {
                    print(
                        'Cargo ID: ${cargo.id}, Invoice Number: ${cargo.invoiceNumber}');
                  });
                }
                setState(() {
                  widget.cargoData.isSelected.value = value!;
                  widget.onSelectionChanged(widget.cargoData.isSelected.value);
                });
              },
            ),
          ),
          Container(
            width: 110.h,
            child: Text(
              widget.cargoData.invoiceNumber.toString(),
              style: theme.textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.0,
              right: 10.0,
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
