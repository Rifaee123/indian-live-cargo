import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/models/thirteenlist_item_model.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/widgets/thirteenlist_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/cargo_deatails_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/controller/cargo_deatails_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_title.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable

class AllCargoScreenScreen extends StatefulWidget {
  const AllCargoScreenScreen({super.key, required this.tripNum});

  final int? tripNum;

  @override
  State<AllCargoScreenScreen> createState() => _AllCargoScreenScreenState();
}

class _AllCargoScreenScreenState extends State<AllCargoScreenScreen> {
  AllCargoScreenController controller = Get.put(AllCargoScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getcargocontroller.getCargos(
        "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a", widget.tripNum!);
  }

  @override
  Widget build(BuildContext context) {
    // controller.tripno = Get.arguments;
    Map<int, String> statusMap = {
      0: 'On the way',
      1: 'Out for Delivery',
      2: 'In Transit',
      3: 'Delivered',
      4: 'Pending',
      5: 'Not Delivered',
      6: 'Recheck',
    };
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(controller.selectedValue.value),
            body: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 25.v,
                  right: 16.h,
                ),
                child: Column(
                  children: [
                    Obx(() => Container(
                          // width: 380.h,
                          height: 50.v,
                          decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.h))),
                          child: Center(
                              child: DropdownButton<int>(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            dropdownColor: Colors.white,
                            focusColor: Colors.black,
                            value: controller.selectedValue.value,
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                controller.selectedValue.value = newValue;
                              }
                            },
                            items: statusMap.entries.map<DropdownMenuItem<int>>(
                                (MapEntry<int, String> entry) {
                              return DropdownMenuItem<int>(
                                value: entry.key,
                                child: Text(entry.value),
                              );
                            }).toList(),
                          )),
                        )),
                    SizedBox(
                      height: 15.v,
                    ),
                    Obx(
                      () => GestureDetector(
                        onLongPress: () {
                          // Show the selection UI (e.g., checkboxes)
                        },
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 12.0,
                            );
                          },
                          itemCount:
                              controller.getcargocontroller.cargoList.length,
                          itemBuilder: (context, index) {
                            CargoData model =
                                controller.getcargocontroller.cargoList[index];

                            return LongPressDraggable(
                              data: model,
                              feedback: ThirteenlistItemWidget(
                                cargoData: model,
                                onSelectionChanged: (isSelected) {
                                  controller.toggleSelection(model);
                                },
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CargoDeatailsScreen(model),
                                  ));
                                },
                                child: ThirteenlistItemWidget(
                                  cargoData: model,
                                  onSelectionChanged: (isSelected) {
                                    controller.toggleSelection(model);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(int selectValue) {
    AllCargoScreenController controller = Get.put(AllCargoScreenController());
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgRightArrow,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 24.v,
          bottom: 21.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_all_cargo".tr,
      ),
      styleType: Style.bgStyle,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 36.v, right: 30.h),
          child: InkWell(
            child: Text("Submit"),
            onTap: () {
              controller.updateStatuscontroller
                  .updateCargoStatus("", controller.cargoIds, selectValue);
            },
          ),
        )
      ],
    );
  }
}
