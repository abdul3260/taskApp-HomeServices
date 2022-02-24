import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_18/Utils/colors.dart';

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

customSnackBar({title, message}) {
  return Get.snackbar(
    title ?? "No title",
    message ?? "No message",
    backgroundColor: colorDeepOrange,
    colorText: colorOffWhite,
    snackPosition: SnackPosition.BOTTOM,
  );
}
