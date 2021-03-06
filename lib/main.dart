import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controler.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/pages/auth/sing_in_page.dart';
import 'package:food_app/pages/auth/sing_up_auth.dart';
import 'package:food_app/pages/cart/cart_page.dart';
import 'package:food_app/pages/food/popular_food_detail.dart';
import 'package:food_app/pages/food/recomended_food_detail.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //HttpOverrides.global = MyHttpOverrides();

  //ByteData data =
  //await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  //SecurityContext.defaultContext
  //  .setTrustedCertificatesBytes(data.buffer.asUint8List());

  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
            //home: MainFoodPage(),
            //home: SplashScreen(),
            //initialRoute: RouteHelper.getInitial(),
            //home: SingInPage(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        });
      },
    );
  }
}
