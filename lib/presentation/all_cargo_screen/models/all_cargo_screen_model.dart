import '../../../core/app_export.dart';
import 'thirteenlist_item_model.dart';

/// This class defines the variables used in the [android_large_ten_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AndroidLargeTenModel {
  Rx<List<ThirteenlistItemModel>> thirteenlistItemList = Rx([
    ThirteenlistItemModel(
        dynamicText: "163212".obs, dynamicText1: "Out For Delivery".obs),
    ThirteenlistItemModel(
        dynamicText: "163517".obs, dynamicText1: "Out For Delivery".obs),
    ThirteenlistItemModel(
        dynamicText: "163816".obs, dynamicText1: "Out For Delivery".obs)
  ]);
}
