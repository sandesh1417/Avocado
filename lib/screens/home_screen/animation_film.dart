import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api/end_points.dart';
import '../../controlles/upcoming_movie_controlles.dart';

class AnimationFilm extends StatelessWidget {
  const AnimationFilm({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingMovieController upcomingMovieController =
        Get.put(UpcomingMovieController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Obx(() => upcomingMovieController.isLoaded.value
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: height + 450,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        (upcomingMovieController.upcomingMovieList.length / 3)
                            .floor(),
                    itemBuilder: (context, i) {
                      // var movies = upcomingMovieController
                      //             .upcomingMovieList[i];
                      return Container(
                        height: height / 4.25,
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, j) {
                              var movies = upcomingMovieController
                                  .upcomingMovieList[j + 3 * i];

                              // if (i == j) {
                              //   movies = upcomingMovieController
                              //       .upcomingMovieList[j];
                              // }

                              return Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                height: height / 4,
                                width: width / 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${APIUrl.imgBaseUrl}${movies.posterPath}"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      );
                    })))
      ],
    );
  }
}


// for(i=0;i<10;i++){
//   for(j=0;j<3;j++){
    
//       movies=a[i];


//   }
// }
