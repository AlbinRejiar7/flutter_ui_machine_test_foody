import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/utils/media_query.dart';
import 'package:flutter_ui_machine_test/widgets/tab_page_builder.dart';
import 'package:get/get.dart';

import '../widgets/custom_tile.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = CustomeSize.customHeight(context);
    var width = CustomeSize.customWidth(context);
    List<String> title = [
      "Burger",
      "Pizza",
      "Diet",
      "Sushi",
    ];
    List<String> image = [
      "asset/png/burger2.png",
      "asset/png/pizzabg.png",
      "asset/png/9329466.png",
      "asset/png/sushibg.png",
    ];
    return Center(
      child: GridView.builder(
        padding: EdgeInsets.only(
            top: height * 0.07, right: width * 0.02, left: width * 0.02),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
        itemCount: title.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTile(
              onTap: () => Get.to(() => TabPages(
                  isTapped: true, title: title[index], image: image[index])),
              title: title[index],
              image: image[index]);
        },
      ),
    );
  }
}
