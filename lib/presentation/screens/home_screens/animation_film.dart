import 'package:flutter/material.dart';

import '../../../data/repositories/api/api_constants.dart';

class AnimationFilm extends StatefulWidget {
  final List<dynamic> movies;
  const AnimationFilm({super.key, required this.movies});

  @override
  State<AnimationFilm> createState() => _AnimationFilmState();
}

class _AnimationFilmState extends State<AnimationFilm> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
            height: height * 1.55,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: (widget.movies.length / 3).floor(),
                itemBuilder: (context, i) {
                  return Container(
                    height: height / 4.25,
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, j) {
                          var movies = widget.movies[j + 3 * i];

                          return Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
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
                }))
      ],
    );
  }
}
