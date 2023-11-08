import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_task/model/product_model.dart';
import 'package:flutter_task/utils/extentions.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../utils/styles.dart';
import 'widgets/banner_widget.dart';
import 'widgets/brand_widget.dart';
import 'widgets/privacy_policy_widget.dart';
import 'widgets/product_widget.dart';
import 'widgets/stepper_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductController controller = Get.put(ProductController());
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 06.hp,
        ),
      ),
      body: Obx(() {
        return controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.productData.value!.products!.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        vertical: 2.hp, horizontal: 3.5.wp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: search,
                          onChanged: (value) {
                            controller.searchProduct(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'What do you want to buy today.',
                            suffixIcon: const Icon(
                                Icons.search), // Trailing search icon
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                        const Gap(15),
                        controller.categories.isNotEmpty
                            ? Row(
                                children: [
                                  SizedBox(
                                      width: 35.wp,
                                      child: Text(
                                        "Select Category",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )),
                                  SizedBox(
                                    width: 55.wp,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: const Row(
                                          children: [
                                            Icon(
                                              Icons.list,
                                              size: 16,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Select Item',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: controller.categories
                                            .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: controller.selectedCat.value,
                                        onChanged: (value) {
                                          controller.onChange(value: value!);
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          height: 50,
                                          width: 160,
                                          padding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            border: Border.all(
                                              color: Colors.black26,
                                            ),
                                            color: Colors.white,
                                          ),
                                          elevation: 2,
                                        ),
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: Colors.grey,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          maxHeight: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          offset: const Offset(-20, 0),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness:
                                                MaterialStateProperty.all(6),
                                            thumbVisibility:
                                                MaterialStateProperty.all(true),
                                          ),
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                          padding: EdgeInsets.only(
                                              left: 14, right: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                        const Gap(15),
                        const BannerWidget(),
                        const Gap(15),
                        StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            children: controller.productData.value!.products!
                                .map((e) => ProductCardWidget(detail: e))
                                .toList()),
                        const Gap(25),
                        StepperWidget(),
                        const Gap(35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SOCIALS',
                              style: Styles.textStyle,
                            ),
                            Text(
                              "PLATFORMS",
                              style: Styles.textStyle,
                            )
                          ],
                        ),
                        const Gap(15),
                        const BrandWidget(),
                        const Gap(15),
                        Text(
                          'SIGN UP',
                          style: Styles.textStyle,
                        ),
                        const Gap(15),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Your email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const Gap(15),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 2.hp),
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle, color: Colors.black),
                          child: Center(
                            child: Text(
                              'SUBSCRIBE',
                              style: Styles.textStyleWhite,
                            ),
                          ),
                        ),
                        const Gap(15),
                        const PrivacyPolicyWidget(),
                        const Gap(45),
                        Center(
                          child: Text(
                            '@2010 - 2022 All Rights Reserved',
                            style: Styles.textStyleGrey,
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text("No Result Found"),
                  );
      }),
    );
  }
}
