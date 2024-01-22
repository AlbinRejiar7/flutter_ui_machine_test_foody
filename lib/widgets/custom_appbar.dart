import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/constants/color_constants.dart';
import 'package:flutter_ui_machine_test/utils/ksizedbox.dart';
import 'package:iconly/iconly.dart';

Column customAppBar(
    double width, GlobalKey<ScaffoldState> scaffoldKey, double height) {
  return Column(
    children: [
      SizedBox(
          width: width * 0.55, child: Image.asset("asset/png/appbar- (1).png")),
      kHeight(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: customWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: const Icon(Icons.menu_rounded),
            ),
          ),
          SizedBox(
              height: height * 0.07,
              child: Image.asset(fit: BoxFit.cover, "asset/png/foodylogo.png")),
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                radius: 28,
                backgroundColor: customYellow,
                child: CircleAvatar(
                  backgroundColor: customWhite,
                  radius: 26,
                  child: Icon(
                    size: 20,
                    IconlyLight.search,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
