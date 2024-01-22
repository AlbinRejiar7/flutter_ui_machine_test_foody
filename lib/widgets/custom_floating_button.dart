import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/constants/color_constants.dart';
import 'package:iconly/iconly.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ]),
      child: FloatingActionButton(
        backgroundColor: customYellow,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(IconlyLight.home),
      ),
    );
  }
}
