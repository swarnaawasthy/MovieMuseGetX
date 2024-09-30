import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/constant/colors.dart';
import 'package:pokemon/feature/application_layer/home_controller.dart';
import 'package:pokemon/feature/presentation_layer/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.globalBlue,
          title: Text(
            "MovieMuse",
            style: TextStyle(color: CustomColor.whiteColor),
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      HorizontalShowList(controller: controller),
                      Expanded(child: VerticalShowList(controller: controller)),
                      controller.selectedImage != null ?Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: CustomColor.globalBlue,
                        ),
                        margin: const EdgeInsets.all(15),
                        height: 300,
                        child:
                        ClipRRect(
                               borderRadius: BorderRadius.circular(20.0),
                               child: Image.network(
                                  controller.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                             )

                      ): const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'No image selected',
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
