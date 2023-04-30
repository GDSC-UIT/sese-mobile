import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/global_widgets/search_input.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/global_widgets/product_grid_view.dart';
import 'package:sese/app/modules/home/widgets/filter.dart';

import '../../../core/values/app_colors.dart';

class HomeCategoryScreen extends StatefulWidget {
  const HomeCategoryScreen({Key? key}) : super(key: key);

  @override
  State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
}

class _HomeCategoryScreenState extends State<HomeCategoryScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.find();
  late TabController tabController;
  GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: globalKey,
        endDrawer: Drawer(
          child: Filter(),
        ),
        appBar: AppBar(
          actions: [
            Container(),
          ],
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: _screeenWidth * 0.6,
                  child: SearchInput(
                    hintText: homeController.typeScreen,
                    color: AppColors.neutralGrey,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (() {
                  globalKey.currentState!.openEndDrawer();
                }),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    const Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.primaryColor,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(
                        "Lọc",
                        style: CustomTextStyle.t6(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          elevation: 1,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 45,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  homeController.typeScreen != ""
                      ? SizedBox(
                          width: 120,
                          child: Text(
                            homeController.typeScreen,
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.h4(AppColors.primaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox(
                          width: 15,
                        ),
                  Expanded(
                    child: TabBar(
                      controller: tabController,
                      indicator: const BoxDecoration(),
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 0, right: 10),
                      tabs: [
                        SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: AppColors.backIcon,
                                size: 5,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Popular",
                                style: CustomTextStyle.t4(
                                    tabController.index == 0
                                        ? AppColors.primaryColor
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: AppColors.backIcon,
                              size: 5,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Newest",
                              style: CustomTextStyle.t4(tabController.index == 1
                                  ? AppColors.primaryColor
                                  : Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: AppColors.backIcon,
                              size: 5,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Near me",
                              style: CustomTextStyle.t4(tabController.index == 2
                                  ? AppColors.primaryColor
                                  : Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 9),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ProductGridView(),
                      ProductGridView(),
                      ProductGridView(),
                    ],
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
