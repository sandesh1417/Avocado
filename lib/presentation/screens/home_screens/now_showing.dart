import 'package:avocado/data/models/now_shows_model.dart';
import 'package:avocado/data/models/upcoming_movie_model.dart';
import 'package:avocado/presentation/screens/movie_details_screen/movie_details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/api/api_constants.dart';

class NowShowing extends StatefulWidget {
  final List<dynamic> movies;
  const NowShowing({Key? key, required this.movies}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  PageController pageController = PageController(viewportFraction: 0.6);
  var currentValue = 0.0;
  var scaleFacto = 0.75;
  double height = 220;
  List<dynamic> movie = [];

  @override
  void initState() {
    super.initState();

    movie = widget.movies;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.movies.length,
        itemBuilder: (_, i, j) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MovieDetailPage(movie: widget.movies[i])),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: NetworkImage(
                      "${APIUrl.imgBaseUrl}${movie[i].posterPath}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9, // Aspect ratio of each item
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true, // Infinite scroll
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              print('Page changed to index $index');
            }));
    // Column(
    //   children: [
    //     SizedBox(
    //       height: 270,
    //       child: PageView.builder(
    //           controller: pageController,
    //           scrollDirection: Axis.horizontal,
    //           physics: const BouncingScrollPhysics(),
    //           itemCount: 10,
    //           itemBuilder: ((context, index) {
    //             return buildPageItem(index, widget.movies[index]);
    //           })),
    //     ),
    //     const SizedBox(height: 10),
    //     DotsIndicator(
    //       dotsCount: 10,
    //       position: currentValue,
    //       decorator: DotsDecorator(
    //         color: AppColor.dotInactiveColor,
    //         size: const Size.square(15),
    //         activeSize: const Size(30, 15),
    //         activeShape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //       ),
    //     ),
    //   ],
    // );
  }
}
