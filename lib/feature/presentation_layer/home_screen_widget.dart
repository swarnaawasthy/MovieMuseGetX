import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/colors.dart';
import 'package:pokemon/feature/application_layer/home_controller.dart';

class HorizontalShowList extends StatelessWidget {
  final HomeController controller;

  const HorizontalShowList({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(20),
        itemCount: controller.showsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.selectImage(controller.showsList[index].imageThumbnailPath);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: CustomColor.globalBlue,
              ),
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  controller.showsList[index].imageThumbnailPath ??
                      'https://via.placeholder.com/100',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class VerticalShowList extends StatelessWidget {
  final HomeController controller;

  const VerticalShowList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20),
      itemCount: controller.showsList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: CustomColor.orangeColor,
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            controller.showsList[index].name ?? '',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
