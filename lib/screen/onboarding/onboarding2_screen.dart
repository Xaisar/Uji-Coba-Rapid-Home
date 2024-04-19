// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../theme/pallet_color.dart';

class OnBoarding2Screen extends StatelessWidget{
  OnBoarding2Screen({super.key, required this.carouselController});
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
            top: MediaQuery.of(context).size.width *0.1
          ),
          child: Image.asset(
            "assets/images/Image_OnBoarding1.png",
            width: MediaQuery.of(context).size.width
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1
          ),
          child: Column(
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
              //title
              const SizedBox(
                height: 30,
              ),
              AutoSizeText.rich(
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 35
                ),
              TextSpan(
                children: [
                  TextSpan(
                    text: "Jaminan \nKualitas",
                    style: TextStyle(
                      color: C10,
                    )
                  ),
                  TextSpan(
                    text: " Jaringan",
                    style: TextStyle(
                      color: C1,
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
                    duration: const Duration(milliseconds: 1400),
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
                  style:TextStyle(
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