import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit/index_recommendation_bloc/index_recommendation_cubit.dart';

import '../../../../theme/pallet_color.dart';

class RecommedationHomeWidget extends StatefulWidget {
  const RecommedationHomeWidget({
    super.key,
  });

  @override
  State<RecommedationHomeWidget> createState() =>
      _RecommedationHomeWidgetState();
}

class _RecommedationHomeWidgetState extends State<RecommedationHomeWidget> {
  int indexRecomendation = 0;

  @override
  Widget build(BuildContext context) {
    final indexRecommendationCubit = BlocProvider.of<IndexRecommendationCubit>(context);

    return Column(
      children: [
        //title Recommendation section
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.041),
          child: Text(
            "Rekomendasi Untuk Anda",
            style: TextStyle(
              color: C6,
              fontSize: 12, 
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        //slide Recommendation
        CarouselSlider.builder(
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: MediaQuery.of(context).size.width * 0.047), 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),       
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/Image_Recomendation.png",
                  width: MediaQuery.of(context).size.width,
                  // fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            enableInfiniteScroll: false,
            reverse: false,
            scrollDirection: Axis.horizontal,
            initialPage: 0,
            onPageChanged: (index, reason) {
              indexRecommendationCubit.onChangeIndex(index);
            },
          ),
        ),
        BlocConsumer<IndexRecommendationCubit, int>(
          listener: (context, state) {
            indexRecomendation = state;
          },
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 7),
                  decoration: BoxDecoration(
                    color: index == state
                      ? Colors.blue
                      : Colors.grey,
                    borderRadius: BorderRadius.circular(99)
                  ),
                );
              })
            );
          },
        )
      ],
    );
  }
}
