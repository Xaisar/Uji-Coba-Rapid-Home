import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../screen/onboarding/onboarding2_screen.dart';
import '../../screen/onboarding/onboarding3_screen.dart';
import '../../screen/onboarding/onboarding4_screen.dart';
import '../../theme/pallet_color.dart';

class OnBoardingMenuScreen extends StatefulWidget{
  const OnBoardingMenuScreen({super.key});

  @override
  State<OnBoardingMenuScreen> createState() => _OnBoardingMenuScreenState();
}

class _OnBoardingMenuScreenState extends State<OnBoardingMenuScreen> {
  int indexpointview = 0;
  CarouselController carouselController = CarouselController();
  late List<Widget> onBoarding = [
    OnBoarding2Screen(carouselController: carouselController),
    OnBoarding3Screen(carouselController: carouselController),
    const OnBoarding4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C15,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.03
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //slide point
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05 
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 8,
                          width: index == indexpointview? 105 : 35,
                          decoration: BoxDecoration(
                            color: index == indexpointview? SlidePointOn: SlidePointOff,
                            borderRadius: BorderRadius.circular(4.5)
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        )
                      ],
                    ); 
                  })
                ),
              ),
              // slide 
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: onBoarding.length,
                  itemBuilder: (context, index, realIndex) {
                    return onBoarding[index];
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height,
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        indexpointview = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}