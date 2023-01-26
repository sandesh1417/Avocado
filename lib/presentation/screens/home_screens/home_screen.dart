import 'package:avocado/logic/blocs/now_shows_blocs/bloc/now_showing_bloc.dart';
import 'package:avocado/logic/blocs/upcoming_shows_blocs/bloc/upcoming_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/texts/normal_text.dart';
import '../../widgets/texts/sub_title.dart';
import '../../widgets/texts/title_text.dart';
import 'animation_film.dart';
import 'now_showing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NowShowingBloc>(context).add(NowShowsFetchEvent());
    BlocProvider.of<UpcomingBloc>(context).add(UpcomingFetchEvent());
    super.initState();
  }

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
              const SearchWidget(),
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
              BlocBuilder<NowShowingBloc, NowShowingState>(
                builder: (context, state) {
                  if (state is NowShowsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NowShowsLoadedState) {
                    return Column(
                      children: [
                        BlocProvider.value(
                          value: BlocProvider.of<NowShowingBloc>(context),
                          child: NowShowing(movies: state.movies),
                        ),
                      ],
                    );
                  } else {
                    return const Text("An Error");
                  }
                },
              ),
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
              BlocBuilder<UpcomingBloc, UpcomingState>(
                builder: (context, state) {
                  if (state is UpcomingLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UpcomingLoadedState) {
                    return Column(
                      children: [
                        BlocProvider.value(
                          value: BlocProvider.of<NowShowingBloc>(context),
                          child: AnimationFilm(movies: state.movies),
                        ),
                      ],
                    );
                  } else {
                    return const Text("An Error");
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
