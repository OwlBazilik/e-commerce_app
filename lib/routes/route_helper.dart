import 'package:food_app/pages/cart/cart_page.dart';
import 'package:food_app/pages/food/popular_food_detail.dart';
import 'package:food_app/pages/food/recomended_food_detail.dart';
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommended_food = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommended_food?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [

    // splash page
  GetPage(name: splashPage, page: () => SplashScreen()),
    // get to main page
    GetPage(name: initial, page: () => HomePage()),

    // get to popular food detail
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!,);
      },
      transition: Transition.fadeIn,
    ),

    // get to recommended food detail
    GetPage(
      name: recommended_food,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!,);
      },
      transition: Transition.fadeIn,
    ),

    // get to cart page
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    )
  ];
}
