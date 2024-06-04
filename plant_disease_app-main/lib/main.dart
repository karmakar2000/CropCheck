import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plant_disease/app/config/constants.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Crop Check",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          toolbarHeight: 65,
          color: AppColor.whiteColor,
        ),
        scaffoldBackgroundColor: AppColor.whiteColor,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
