// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/constants/color_constants.dart';
import 'package:flutter_ui_machine_test/utils/ksizedbox.dart';

import '../utils/media_query.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;
  const CustomTile({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var height = CustomeSize.customHeight(context);
    var textScalar = CustomeSize.textScaleFactor(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.23,
        width: height * 0.21,
        decoration: BoxDecoration(
            color: customWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(60),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(30))),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -3),
              child: SizedBox(
                height: height * 0.2,
                child: Hero(
                    tag: "hero-$title",
                    child: Image.asset(fit: BoxFit.cover, image)),
              ),
            ),
            Align(
              alignment: const Alignment(1.2, 1),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    textScaleFactor: textScalar,
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w900, fontSize: textScalar * 18),
                  ),
                  kWidth(20),
                  Container(
                    height: height * 0.06,
                    width: height * 0.06,
                    decoration: BoxDecoration(
                        color: customYellow,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(weight: 10, size: 17, Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
