//import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/base/show_custom_snackbar.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_text_fiel.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password length");
      } else {
        showCustomSnackBar("All went well",
            title: "Perfect", color: Colors.greenAccent);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            // app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/logo_part_1.png",
                  ),
                ),
              ),
            ),
            // app email
            AppTextField(
              texController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: Dimensions.height20),
            // app password
            AppTextField(
              texController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(height: Dimensions.height20),
            // app name
            AppTextField(
              texController: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
            SizedBox(height: Dimensions.height20),
            // app phne
            AppTextField(
              texController: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(height: Dimensions.height20),
            // sing up
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor),
                child: Center(
                  child: BigText(
                    text: "Sing up",
                    size: Dimensions.font26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            // text
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight * 0.05),
            RichText(
              text: TextSpan(
                text: "Sing up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font16,
                ),
              ),
            ),
            // logo social
            Wrap(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundImage:
                          AssetImage("assets/images/" + singUpImages[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
