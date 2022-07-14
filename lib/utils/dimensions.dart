import 'package:get/get.dart';

class Dimensions {
  //Pixel 4 XL -> 820 x 411
  //Pixel XL -> 684 x

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // dynamic heigh blocks
  // 2.14 = 684/320 = size phone displaay / size first block
  // 3.1 = 684/220 = size phone displaay / size first block picture
  // 5.7 = 684/120 = size phone displaay / size first block text
  static double pageView = screenHeight / 2.56;
  static double pageViewContainer = screenHeight / 3.72;
  static double pageViewTextContainer = screenHeight / 6.83;

  // dynamic height padding and margin
  static double height10 = screenHeight / 82.0;
  static double height15 = screenHeight / 54.6;
  static double height20 = screenHeight / 41.0;
  static double height30 = screenHeight / 27.3;
  static double height45 = screenHeight / 18.2;
  static double height55 = screenHeight / 14.9;

  // dynamic width
  static double width8 = screenHeight / 102.5;
  static double width10 = screenHeight / 82.0;
  static double width15 = screenHeight / 54.6;
  static double width20 = screenHeight / 41.0;
  static double width30 = screenHeight / 27.3;
  static double width45 = screenHeight / 18.2;

  // font size
  static double font16 = screenHeight / 51.5;
  static double font20 = screenHeight / 41.0;
  static double font24 = screenHeight / 34.16;
  static double font26 = screenHeight / 31.53;

  static double radius15 = screenHeight / 54.6;
  static double radius20 = screenHeight / 41.0;
  static double radius30 = screenHeight / 27.3;

  // icon search size
  static double iconSize24 = screenHeight / 34.16;
  static double iconSize26 = screenHeight / 31.53;

  // popular food values
  static double popularFoodImgSize = screenHeight / 2.34;
  static double bottomHeightBar = screenHeight / 6.83;

  // spalsh screen dimensions
  static double splashImg1 = screenHeight / 3.28;
  static double splashImg2 = screenHeight / 2.74;
}
