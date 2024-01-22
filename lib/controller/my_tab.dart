import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabs extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "Burger",
    ),
    const Tab(
      text: "Sushi",
    ),
    const Tab(
      text: "pizza",
    ),
  ];
  @override
  void onInit() {
    controller = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
