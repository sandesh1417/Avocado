import 'package:avocado/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
