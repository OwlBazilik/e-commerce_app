import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';

//import 'package:get/state_manager.dart';

// if you load data from internet extend GetxService
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URIL);
    //return await apiClient.getData("https://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}
