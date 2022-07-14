import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/widgets/big_text.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({
    Key? key,
    required this.text,
    this.imgPath = "assets/images/empty_cart.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.02,
            color: Theme.of(context).disabledColor,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
