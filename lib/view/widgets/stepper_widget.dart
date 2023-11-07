import 'package:flutter/material.dart';
import 'package:flutter_task/controller/product_controller.dart';
import 'package:flutter_task/utils/extentions.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class StepperWidget extends StatelessWidget {
  StepperWidget({
    super.key,
  });

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 5.hp,
            width: 10.wp,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey)),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: 2.hp,
            ),
          ),
          const Gap(3),
          ...[1, 2, 3].map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.wp),
                child: Container(
                  height: 5.hp,
                  width: 10.wp,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey)),
                  child: Text(
                    e.toString(),
                    style:
                        Styles.textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          const Gap(3),
          Container(
            height: 5.hp,
            width: 10.wp,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey)),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black,
              size: 2.hp,
            ),
          ),
        ],
      ),
    );
  }
}
