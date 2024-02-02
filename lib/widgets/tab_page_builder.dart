// ignore_for_file:, deprecated_member_use,

import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/constants/color_constants.dart';
import 'package:flutter_ui_machine_test/controller/order_controller.dart';
import 'package:flutter_ui_machine_test/utils/ksizedbox.dart';
import 'package:flutter_ui_machine_test/utils/media_query.dart';
import 'package:flutter_ui_machine_test/widgets/custom_appbar.dart';
import 'package:flutter_ui_machine_test/widgets/custom_bottom_bar.dart';
import 'package:flutter_ui_machine_test/widgets/custom_floating_button.dart';
import 'package:get/get.dart';

class TabPages extends StatelessWidget {
  final String title;
  final String image;
  final bool? isTapped;
  const TabPages({
    super.key,
    required this.title,
    required this.image,
    this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    final OrderController c = Get.put(OrderController());
    var height = CustomeSize.customHeight(context);
    var width = CustomeSize.customWidth(context);
    var textScale = CustomeSize.textScaleFactor(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("asset/png/backgroundimage.png"),
          )),
          child: Column(
            children: [
              isTapped == true
                  ? AppBar(
                      automaticallyImplyLeading: false,
                      toolbarHeight: 20,
                      flexibleSpace: customAppBar(width, scaffoldKey, height),
                    )
                  : const SizedBox(),
              SizedBox(
                  height: height * 0.39,
                  child: Hero(tag: "hero-$title", child: Image.asset(image))),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height * 0.06,
                    width: width * 0.24,
                    decoration: const BoxDecoration(
                        color: customYellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.timer_sharp),
                          Text(
                            "30 mins",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isTapped == true
                  ? kHeight(height * 0.07)
                  : kHeight(height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textScaleFactor: textScale,
                          title,
                          style: TextStyle(
                              fontSize: textScale * 25,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          children: [
                            CustomButton(
                              onTap: () {
                                c.decrement();
                              },
                              myColor: customGrey,
                              myIcon: Icons.remove,
                            ),
                            kWidth(10),
                            Obx(
                              () => Text(
                                "${c.quantity}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            kWidth(10),
                            CustomButton(
                              onTap: () {
                                c.increment();
                              },
                              myColor: customYellow,
                              myIcon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            textScaleFactor: textScale,
                            "The Best Baked Garlic Butter Pork Tendelion\nrecipe ever",
                            style: TextStyle(fontSize: textScale * 14)),
                      ],
                    ),
                    isTapped == true
                        ? kHeight(height * 0.06)
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: height * 0.06,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: customWhite,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total Price:"),
                              Text(
                                textScaleFactor: textScale,
                                "25\$",
                                style: TextStyle(
                                    fontSize: textScale * 17,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: height * 0.07,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: customYellow,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textScaleFactor: textScale,
                                "ORDER",
                                style: TextStyle(
                                    fontSize: textScale * 17,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar:
          isTapped == true ? const CustomBottomBar() : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          isTapped == true ? const CustomFloatingButton() : const SizedBox(),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData myIcon;
  final Color myColor;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.myIcon,
    required this.myColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
          radius: 15,
          backgroundColor: myColor,
          child: Icon(
            myIcon,
            size: 15,
          )),
    );
  }
}
