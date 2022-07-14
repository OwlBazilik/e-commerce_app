//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/base/no_data_page.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat("yyy-MM-dd HH:mm:ss")
            .parse(getCartHistoryList[listCounter].time!);
        var inputData = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("MM//dd/yyyy hh:mm a");
        outputDate = outputFormat.format(inputData);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
        body: Column(
      children: [
        // header or app bar
        Container(
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: Dimensions.height45),
          height: Dimensions.height20 * 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(
                text: "Cart History",
                color: Colors.white,
              ),
              AppIcon(
                icon: Icons.shopping_cart_outlined,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 30,
              ),
            ],
          ),
        ),
        // body
        GetBuilder<CartController>(builder: (_cartController) {
          return _cartController.getCartHistoryList().length > 0
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: MediaQuery.removeViewPadding(
                      removeTop: true,
                      context: context,
                      child: ListView(
                        children: [
                          for (int i = 0; i < itemsPerOrder.length; i++)
                            Container(
                              height: Dimensions.height30 * 4,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  timeWidget(listCounter),
                                  //BigText(text: getCartHistoryList[listCounter].time!),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            itemsPerOrder[i], (index) {
                                          if (listCounter <
                                              getCartHistoryList.length) {
                                            listCounter++;
                                          }
                                          return index <= 2
                                              ? Container(
                                                  height:
                                                      Dimensions.height20 * 4,
                                                  width: Dimensions.width20 * 4,
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimensions.width10 /
                                                              2),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                                  .radius15 /
                                                              2),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOAD_URL +
                                                              getCartHistoryList[
                                                                      listCounter -
                                                                          1]
                                                                  .img!))),
                                                )
                                              : Container();
                                        }),
                                      ),
                                      Container(
                                        height: Dimensions.height20 * 4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SmallText(
                                              text: "Total",
                                              color: AppColors.titleColor,
                                            ),
                                            BigText(
                                              text:
                                                  "Items ${itemsPerOrder[i].toString()}",
                                              color: AppColors.titleColor,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                var orderTime =
                                                    cartOrderTimeToList();
                                                Map<int, CartModel> moreOrder =
                                                    {};
                                                for (int j = 0;
                                                    j <
                                                        getCartHistoryList
                                                            .length;
                                                    j++) {
                                                  if (getCartHistoryList[j]
                                                          .time ==
                                                      orderTime[i]) {
                                                    //print("My order time is " + orderTime[i]);
                                                    //print("Cart product id " + getCartHistoryList[j].id.toString());
                                                    moreOrder.putIfAbsent(
                                                        getCartHistoryList[j]
                                                            .id!,
                                                        () => CartModel.fromJson(
                                                            jsonDecode(jsonEncode(
                                                                getCartHistoryList[
                                                                    j]))));
                                                  }
                                                }
                                                Get.find<CartController>()
                                                    .setItems = moreOrder;
                                                Get.find<CartController>()
                                                    .addToCartList();
                                                Get.toNamed(
                                                    RouteHelper.getCartPage());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width10,
                                                  vertical:
                                                      Dimensions.height10 / 2,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                    .radius15 /
                                                                2),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors
                                                            .mainColor)),
                                                child: SmallText(
                                                  text: "One more",
                                                  color: AppColors.mainColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
              //
              : Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: NoDataPage(
                    text: "You didn`t buy anything so far!",
                    imgPath: "assets/images/empty_box.png",
                  ));
        }),
        //
      ],
    ));
  }
}
