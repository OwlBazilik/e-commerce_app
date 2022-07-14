import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/account_wdget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Center(
            child: BigText(
              text: "Profile",
              size: 24,
              color: Colors.white,
            ),
          )),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            // profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15 * 5,
              size: Dimensions.height30 * 5,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // name
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Vasya",
                        )),
                    SizedBox(height: Dimensions.height20),
                    // phone
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "784542142055",
                        )),
                    SizedBox(height: Dimensions.height20),
                    // email
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "@mail.com",
                        )),
                    SizedBox(height: Dimensions.height20),
                    // address
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Address",
                        )),
                    SizedBox(height: Dimensions.height20),
                    // message
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Vasya",
                        )),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
