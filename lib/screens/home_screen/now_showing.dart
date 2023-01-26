import 'package:avocado/constants/app/app_colors.dart';
import 'package:avocado/models/now_showing_movie_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api/end_points.dart';
import '../../controlles/now_showing_controller.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({Key? key}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  PageController pageController = PageController(viewportFraction: 0.6);
  var currentValue = 0.0;
  var scaleFacto = 0.75;
  double height = 220;
  bool isBlur = false;

  List<String> nowShows = [
    "assets/images/marvel.png",
    "assets/images/avengers.png",
    "assets/images/doctor_strange.png",
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final NowShowsMovieController nowShowsMovieController =
        Get.put(NowShowsMovieController());
    // print("height:" + Dimension.screenHeight.toString());
    // print("width:" + Dimension.screenWidth.toString());
    return Column(
      children: [
        Obx(
          () => nowShowsMovieController.isLoaded.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 320,
                  child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return buildPageItem(index,
                            nowShowsMovieController.nowShowsMovieList[index]);
                      })),
                ),
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: 10,
          position: currentValue,
          decorator: DotsDecorator(
            color: AppColor.dotInactiveColor,
            size: const Size.square(15),
            activeSize: const Size(30, 15),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget buildPageItem(int index, NowShowingMovieModel movie) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentValue.floor()) {
      var currScale = 1 - (currentValue - index) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == currentValue.floor() + 1) {
      var currScale =
          scaleFacto + (currentValue - index + 1) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == currentValue.floor() - 1) {
      var currScale = 1 - (currentValue - index) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else {
      var currScale = 0.8;
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
            image: NetworkImage("${APIUrl.imgBaseUrl}${movie.posterPath}"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
