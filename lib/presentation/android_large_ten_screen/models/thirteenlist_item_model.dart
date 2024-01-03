import '../../../core/app_export.dart';

/// This class is used in the [thirteenlist_item_widget] screen.
class ThirteenlistItemModel {
  ThirteenlistItemModel({
    this.dynamicText,
    this.dynamicText1,
    this.id,
  }) {
    dynamicText = dynamicText ?? Rx("163212");
    dynamicText1 = dynamicText1 ?? Rx("Out For Delivery");
    id = id ?? Rx("");
  }

  Rx<String>? dynamicText;

  Rx<String>? dynamicText1;

  Rx<String>? id;
}
