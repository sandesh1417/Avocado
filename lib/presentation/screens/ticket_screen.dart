import 'package:avocado/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.backGroundColor,
          title: const Text("Ticket Screen")),
    );
  }
}
