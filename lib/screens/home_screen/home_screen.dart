import 'package:avocado/screens/home_screen/animation_film.dart';
import 'package:avocado/screens/home_screen/now_showing.dart';
import 'package:flutter/material.dart';

import '../../constants/app/app_colors.dart';
import '../../widgets/text_form.dart';
import '../../widgets/texts/normal_text.dart';
import '../../widgets/texts/sub_title.dart';
import '../../widgets/texts/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   BlocProvider.of<ProductBloc>(context).add(ProductFetchEvent());
  //   super.initState();
  // }

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //heder part
              Container(
                padding: const EdgeInsets.only(
                    top: 30, right: 0, bottom: 10, left: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                            height: 50,
                            width: 50,
                            image: AssetImage("assets/images/profile.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TitleText(
                              firstText: "Hello",
                              secondText: " Biraj",
                              colors: AppColor.whiteColor,
                            ),
                            NormalText(
                              text: "Book your favorite movie",
                              textColor: AppColor.whiteColor,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.containerColor),
                      child: const Icon(
                        Icons.notifications,
                        size: 25,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextForm(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SubTitleText(
                    firstText: "Now",
                    secondText: " Showing",
                    colors: AppColor.whiteColor,
                  ),
                  NormalText(
                    text: "See more",
                    textColor: AppColor.whiteColor,
                    size: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const NowShowing(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SubTitleText(
                    firstText: "Animation",
                    secondText: " Film",
                    colors: AppColor.whiteColor,
                  ),
                  NormalText(
                    text: "See more",
                    textColor: AppColor.whiteColor,
                    size: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const AnimationFilm()
            ]),
          ),
        ),
      ),
    );
  }
}
