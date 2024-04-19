import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/all_cargo_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/models/thirteenlist_item_model.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/widgets/thirteenlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/all_tripsheet_screen_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/cargo_deatails_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/controller/cargo_deatails_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_title.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/custom_app_bar.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AllCargoListingScreenScreen extends StatefulWidget {
  const AllCargoListingScreenScreen({super.key, required this.tripNum});

  final int? tripNum;

  @override
  State<AllCargoListingScreenScreen> createState() =>
      _AllCargoListingScreenScreenState();
}

class _AllCargoListingScreenScreenState
    extends State<AllCargoListingScreenScreen> {
  AllCargoScreenController controller = Get.put(AllCargoScreenController());
  bool isLodingmore = false;
  int page = 0;
  // List<CargoData> cargoaddedList = <CargoData>[];

  final scrollcontroller = ScrollController();
  void clearimage() {
    controller.imagePath.value = null;
    controller.cropedfile.value = null;
  }

  //lock

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      page = 0;
    });
    // controller.getcargocontroller.cargoaddedList.clear();

    scrollcontroller.addListener(_scrollListner);
    if (controller.getcargocontroller.cargoList.isEmpty) {  
      controller.getcargocontroller.getCargos(widget.tripNum!, page);
    }

    // // controller.getcargocontroller.cargoaddedList = controller.getcargocontroller.cargoaddedList + controller.cargoList;

    clearimage();
  }

  void _scrollListner() async {
    if (isLodingmore == true) return;
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        isLodingmore = true;
        if (controller.getcargocontroller.cargoList.length != 0) {
          page = page + 10;
        }
      });

      await controller.getcargocontroller.getCargos(widget.tripNum!, page);
      // cargoaddedList = cargoaddedList + controller.cargoList;

      log(page.toString());
      log("scrolled+");
      setState(() {
        isLodingmore = false;
      });
    }
    // else if (scrollcontroller.position.pixels ==
    //     scrollcontroller.position.minScrollExtent) {
    //   setState(() {
    //     isLodingmore = true;
    //   });
    //   page = page - 10;
    //   await controller.getcargocontroller.getCargos(
    //       "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a",
    //       widget.tripNum!,
    //       page);
    //   // cargoaddedList = cargoaddedList + controller.cargoList;

    //   print("call");
    //   log("scrolled-");
    //   log(page.toString());
    //   setState(() {
    //     isLodingmore = false;
    //   });
    // }
    else {
      log("scrolling");
    }
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
    Map<int, Color> ColorMap = {
      0: Color(0xff9fa6b2),
      1: Color(0xff3b71ca),
      2: Color(0xff54b4d3),
      3: Color(0xff14a44d),
      4: Color(0xffe4a11b),
      5: Color(0xffdc4c64),
      6: Color(0xffdc4c64),
    };

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(controller.selectedValue.value),
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 25.v,
                    right: 16.h,
                  ),
                  child: Column(
                    children: [
                      Obx(() => Center(
                            child: Text(
                                "Total Cargo ${controller.getcargocontroller.cargoaddedList.length}"),
                          )),
                      SizedBox(
                        height: 15.v,
                      ),
                      Obx(
                        () => GestureDetector(
                          onLongPress: () {
                            // Show the selection UI (e.g., checkboxes)
                          },
                          child: controller
                                      .getcargocontroller.isLoading.value &&
                                  page == 1
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.getcargocontroller.cargoaddedList
                                          .length ==
                                      0
                                  ? Center(child: Text("no data"))
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 20.v),
                                      child: SizedBox(
                                        height: 500.v,
                                        child: RefreshIndicator(
                                          onRefresh: () async {
                                            controller.getcargocontroller
                                                .cargoaddedList
                                                .clear();
                                            setState(() {
                                              page = 0;
                                            });

                                            controller.getcargocontroller
                                                .getCargos(widget.tripNum!, 0);
                                          },
                                          child: ListView.builder(
                                            controller: scrollcontroller,
                                            shrinkWrap: true,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            itemCount: controller
                                                    .getcargocontroller
                                                    .isLoading
                                                    .value
                                                ? controller.getcargocontroller
                                                        .cargoaddedList.length +
                                                    1
                                                : controller.getcargocontroller
                                                    .cargoaddedList.length,
                                            itemBuilder: (context, index) {
                                              if (index <
                                                  controller.getcargocontroller
                                                      .cargoaddedList.length) {
                                                CargoData model = controller
                                                    .getcargocontroller
                                                    .cargoaddedList[index];
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.v),
                                                  child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              CargoDeatailsScreen(
                                                            model,
                                                            tripNum:
                                                                widget.tripNum,
                                                            page: page,
                                                          ),
                                                        ));
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 22.0,
                                                          vertical: 17.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorMap[
                                                              model.status],
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 150.h,
                                                              child: Text(
                                                                model
                                                                    .invoiceNumber
                                                                    .toString(),
                                                                style: theme
                                                                    .textTheme
                                                                    .titleLarge,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 6.0,
                                                                right: 4.0,
                                                                bottom: 3.0,
                                                              ),
                                                              child: Text(
                                                                statusMap[model
                                                                        .status]
                                                                    .toString()
                                                                    .toUpperCase(),
                                                                style: theme
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                );
                                              } else {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                      SizedBox(
                        height: 25.v,
                      ),
                    ],
                  )),
            )));
  }

  Widget _body() {
    if (controller.cropedfile.value != null ||
        controller.imagePath.value != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    if (controller.cropedfile.value != null) {
      final path = controller.cropedfile.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300.h,
          maxHeight: 300.v,
        ),
        child: Image.file(File(path)),
      );
    } else if (controller.imagePath.value != null) {
      final path = controller.imagePath.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300.h,
          maxHeight: 300.v,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            controller.clear();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (controller.cropedfile.value == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () async {
                await controller.cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
        child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 320.0,
        height: 350.0,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DottedBorder(
                    radius: const Radius.circular(12.0),
                    dashPattern: const [8, 4],
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Upload an image to start',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.openCamera();
                          },
                          child: Container(
                            height: 60.v,
                            width: 67.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius: BorderRadius.circular(
                                10.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        Text(
                          "lbl_camara".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.openGallery();
                          },
                          child: Container(
                            height: 60.v,
                            width: 69.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius: BorderRadius.circular(
                                10.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Text(
                          "lbl_gallery".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.v,
              )
            ]),
      ),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(int selectValue) {
    AllCargoScreenController controller = Get.put(AllCargoScreenController());
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        id: widget.tripNum,
        onTap: () {
          log("back");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AllTripsheetScreen(),
          ));

          controller.selectedCargoItems.clear();
          controller.cargoIds.value = "";
          log(controller.selectedCargoItems.length.toString());
        },
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
        SizedBox(
          width: 30.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 36.v, right: 30.h),
          child: InkWell(
            child: Text("Change Status"),
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AllCargoScreenScreen(tripNum: widget.tripNum),
              ));
              // await controller.updateStatuscontroller
              //     .updateCargoStatus(
              //         authtoken: "",
              //         cargoIds: controller.cargoIds.value,
              //         statusId: controller.selectedValue.value)
              //     .then((value) => controller.getcargocontroller.getCargos(
              //         "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a",
              //         widget.tripNum!));
            },
          ),
        )
      ],
    );
  }
}
