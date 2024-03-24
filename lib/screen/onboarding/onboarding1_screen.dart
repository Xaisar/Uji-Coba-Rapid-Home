import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../route/routes_name.dart';

import '../../theme/pallet_color.dart';

class OnBoarding1Screen extends StatelessWidget{
  const OnBoarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C13,
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.07
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Text Welcome
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: C3,
                      fontSize: 50
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //logo
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: [
                        //background logo
                        Image.asset(
                          "assets/logos/Background_Logo.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                        //front logo
                        Image.asset(
                          "assets/logos/Front_Logo.png",
                          height: MediaQuery.of(context).size.height *0.25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //title
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText.rich(
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 30,
                        color: C3
                      ),
                       const TextSpan(
                        children: [
                          TextSpan(
                            text: "Layanan Internet untuk",
                          ),
                          TextSpan(
                            text: " semua",
                            style: TextStyle(
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ] 
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: C5,
                        borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: AutoSizeText(
                        "kebutuhanmu!",
                        maxLines: 1,
                        style: TextStyle(
                          color: C3,
                          fontSize: 30
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //button Start
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: (){
                       Navigator.of(context).pushReplacementNamed(ONBOARDINGMENU);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: C9
                    ),
                    label: Text(
                      "Started",
                      style: TextStyle(
                        color: C3,
                        fontSize: 20
                      )
                    ),
                    icon: Icon(
                      Icons. arrow_back_rounded,
                      color: C3,
                      size: 20
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}