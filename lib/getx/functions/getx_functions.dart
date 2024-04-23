import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXFunctions {
  static void navigate(Widget page) {
    Get.to(transition: Transition.upToDown, curve: Curves.easeInBack, page);
  }
}
