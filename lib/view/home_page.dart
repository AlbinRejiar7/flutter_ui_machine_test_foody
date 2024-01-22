import 'package:flutter/material.dart';
import 'package:flutter_ui_machine_test/constants/color_constants.dart';
import 'package:flutter_ui_machine_test/controller/my_tab.dart';
import 'package:flutter_ui_machine_test/utils/media_query.dart';
import 'package:flutter_ui_machine_test/view/all_page.dart';
import 'package:flutter_ui_machine_test/widgets/custom_appbar.dart';
import 'package:flutter_ui_machine_test/widgets/custom_bottom_bar.dart';
import 'package:flutter_ui_machine_test/widgets/custom_floating_button.dart';
import 'package:flutter_ui_machine_test/widgets/tab_page_builder.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyTabs tabs = Get.put(MyTabs());
    var height = CustomeSize.customHeight(context);

    var width = CustomeSize.customWidth(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: customWhite,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                    child: TabBar(
                        unselectedLabelStyle:
                            const TextStyle(fontWeight: FontWeight.normal),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        labelColor: customBlack,
                        dividerColor: Colors.transparent,
                        indicatorColor: customYellow,
                        controller: tabs.controller,
                        tabs: tabs.myTabs)),
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xfffdfdfc),
                    radius: 30,
                    child: Icon(
                      Icons.equalizer,
                      color: customYellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.12,
          flexibleSpace: customAppBar(width, scaffoldKey, height),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('asset/png/backgroundscafold.png'))),
          child: TabBarView(
            controller: tabs.controller,
            children: const [
              AllPage(),
              TabPages(title: "Burger", image: "asset/png/burger2.png"),
              TabPages(title: "Sushi", image: "asset/png/sushi.jpg"),
              TabPages(title: "Pizza", image: "asset/png/pizza.jpg")
            ],
          ),
        ),
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomBar());
  }
}
