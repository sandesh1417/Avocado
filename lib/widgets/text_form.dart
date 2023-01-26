import 'package:avocado/constants/app/app_colors.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.tune_sharp,
              color: AppColor.whiteColor,
              size: 30,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColor.whiteColor,
              size: 30,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColor.containerColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColor.containerColor,
                )),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: "Search here...",
            hintStyle: const TextStyle(color: AppColor.whiteColor)),
      ),
    );
  }
}
