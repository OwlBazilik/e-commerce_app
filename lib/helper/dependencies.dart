import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controler.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/data/repository/popular_product_repo.dart';
import 'package:food_app/data/repository/recommended_product_repo.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {

  //SharedPreferences.setMockInitialValues({});  
  final sharedPrefarences = await SharedPreferences.getInstance();
  
  Get.lazyPut(() => sharedPrefarences);
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URLL));
  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //Get.lazyPut(() => CartRepo());
  
  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

}