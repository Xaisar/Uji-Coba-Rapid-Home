// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../theme/pallet_color.dart';

class OnBoarding3Screen extends StatelessWidget{
  OnBoarding3Screen({super.key, required this.carouselController});
  CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //gambar
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width *0.1,
            left: MediaQuery.of(context).size.width *0.0375,
            right: MediaQuery.of(context).size.width *0.0375
          ),
          child: Image.asset(
            "assets/images/Image_OnBoarding2.png",
            width: MediaQuery.of(context).size.width
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //note text
              AutoSizeText(
                "Layanan internet terbaik untuk rumahmu",
                maxLines: 1,
                style: TextStyle(
                  color: C10,
                  fontSize: 12
                )
              ),
              const SizedBox(
                height: 30,
              ),
              AutoSizeText.rich(
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 30
                ),
              //title
              TextSpan(
                children: [
                  TextSpan(
                    text: "Unlimited \n",
                    style: TextStyle(
                      color: C1,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  TextSpan(
                    text: "Bebas Tanpa",
                    style: TextStyle(
                      color: C10,
                    )
                  ),
                  TextSpan(
                    text: " Kuota",
                    style: TextStyle(
                      color: C14,
                    fontWeight: FontWeight.w600
                    )
                  )
                ]
              )
            )
            ],
          )
        ),
        //button section
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: (){
                  carouselController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastEaseInToSlowEaseOut
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: C8,
                    fontSize: 16
                  ),
                )
              ),
              ElevatedButton(
                onPressed: (){
                  carouselController.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastEaseInToSlowEaseOut
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: C5
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: C3,
                    fontSize: 16
                  ),
                )
              )
            ]
          ),
        )
      ],
    );
  }

}