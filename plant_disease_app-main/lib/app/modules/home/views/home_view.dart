import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease/app/config/constants.dart';
import '../../common/rounded_button.dart';
import '../controllers/home_controller.dart';
import 'components/body_text.dart';
import 'components/image_box.dart';
import 'components/processing_widget.dart';
import 'components/result_widget.dart';
import 'components/solution_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 200,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyText(),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ImageBox(
                        image: "assets/images/click.jpg",
                        text: "Take A Picture",
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios, size: 28),
                      SizedBox(width: 6),
                      ImageBox(
                        image: "assets/images/complete.png",
                        text: "Get Result",
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios, size: 28),
                      SizedBox(width: 6),
                      ImageBox(
                        image: "assets/images/analysis.jpg",
                        text: "Analysis",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    click: () async {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return chooseSourceImage(context, controller);
                          });
                    },
                    child: const Text(
                      "Take a picture",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isImageSelected.value
                  ? Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.file(
                                controller.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (controller.isLoading.value)
                            const ProcessingWidget(),
                          if (controller.isSuccess.value &&
                              controller.result != null)
                            ResultWidget(
                              result: controller.result!.value,
                            ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 16),
            Obx(
              () => controller.isImageSelected.value
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.reset(),
                          icon: const Icon(Icons.clear),
                          label: const Text(
                            "Clear",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.secondaryColor)),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            // SolutionList(
            //   solution: solution,
            // ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => controller.isSuccess.value && controller.result != null
                  ? SolutionList(
                      solution: controller.result!.value.solution,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget chooseSourceImage(BuildContext context, HomeController controller) {
    // set up the AlertDialog
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.imagePicker('camera');
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Camera")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  controller.imagePicker('gallery');
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.image,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Gallery")
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
