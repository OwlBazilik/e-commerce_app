import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/pages/home/food_page_body.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("Current height is " + MediaQuery.of(context).size.height.toString());
    //print("Current height is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height55, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Lviv",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Yumlmy",
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                          width: Dimensions.width45,
                          height: Dimensions.height45,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimensions.iconSize24,
                          )),
                    )
                  ],
                ))),
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
