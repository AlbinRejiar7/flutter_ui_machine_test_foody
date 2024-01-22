import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/utils/media_query.dart';
import 'package:iconly/iconly.dart';

import '../constants/color_constants.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = CustomeSize.customHeight(context);
    var width = CustomeSize.customWidth(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      height: height * 0.08,
      decoration: const BoxDecoration(
          color: customPurple,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkResponse(
            onTap: () {},
            child: const Icon(
              IconlyLight.bag,
              color: customWhite,
              size: 25,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: const Icon(
              IconlyLight.notification,
              color: customWhite,
              size: 25,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: const Icon(
              IconlyLight.profile,
              color: customWhite,
              size: 25,
            ),
          ),
          InkResponse(
            onTap: () {},
            child: const Icon(
              IconlyLight.chat,
              color: customWhite,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
