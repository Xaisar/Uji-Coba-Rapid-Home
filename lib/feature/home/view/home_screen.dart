import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../theme/pallet_color.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreenView();
  }
}

class HomeScreenView extends StatefulWidget{
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
double dataChart = 60.78;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        //background
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Image.asset(
            "assets/images/Image_Home_Background.png",
            width: MediaQuery.of(context).size.width,
            )
        ),
        //FrontView
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: C3,
                ),
                const SizedBox(
                   width : 10,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hanif Marshal",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: C3,
                          fontSize: 12,
                          fontWeight: FontWeight.w600 
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "hanifmarshal@email.com",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: C3,
                          fontSize: 12,
                          fontWeight: FontWeight.w400 
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add,
                    color: C3,
                    size: 20,
                  )
                )
              ],
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.search_rounded,
                  color: C3,
                )
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.notifications_rounded,
                  color: C3,
                )
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                bottom: MediaQuery.of(context).size.height * 0.025
              ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //card section
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.041
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          const Color(0xFF0B3194).withOpacity(0.2),
                          const Color(0xFF208CDA).withOpacity(0.94)
                        ]
                      ),
                      border: Border.all(
                        color: const Color(0xFF0971A6),
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.047
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Start Home",
                                style: TextStyle(
                                  color: C3,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  //card bagian kiri
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          child: SfRadialGauge(
                                            enableLoadingAnimation: true,
                                            animationDuration: 1000,
                                            axes: <RadialAxis>[
                                              RadialAxis(
                                                canScaleToFit: true,
                                                showAxisLine: false,
                                                showLabels: false,
                                                showTicks: false,
                                                startAngle: 180,
                                                endAngle: 360,
                                                maximum: 100,
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                    value: dataChart ,
                                                    needleColor: Colors.red,
                                                    needleEndWidth: 3,
                                                    needleLength: 0.5,
                                                    // knobStyle: KnobStyle(),
                                                  ),
                                                ],
                                                ranges: <GaugeRange>[
                                                  GaugeRange(
                                                    startValue: 0, 
                                                    endValue: dataChart,
                                                    sizeUnit: GaugeSizeUnit.factor,
                                                    startWidth: 0.2,
                                                    endWidth: 0.2,
                                                    color: C9
                                                  ),
                                                  GaugeRange(
                                                    startValue: dataChart,
                                                    endValue: 100,
                                                    sizeUnit: GaugeSizeUnit.factor,
                                                    startWidth: 0.2,
                                                    endWidth: 0.2,
                                                    color: C1,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // const SizedBox(
                                        //   height: 3,
                                        // ),
                                        Text(
                                          dataChart.toString(),
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: C3,
                                            ),
                                            children: const [
                                              TextSpan(
                                                text: "Mbps/",
                                                style: TextStyle(
                                                  fontSize: 10
                                                )
                                              ),
                                              TextSpan(
                                                text: "sec",
                                                style: TextStyle(
                                                  fontSize: 8
                                                )
                                              ),
                                            ]
                                          )
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                                    width: 1,
                                    height: 100,
                                    color: const Color(0xFFACC5FB),
                                  ),
                                  //card bagian tengah
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Tagihan Internet",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 10
                                          ),
                                        ),
                                        Text(
                                          "Rp 205,000",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500
                                          )
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: C3,
                                              fontSize: 9
                                            ),
                                            children: const [
                                              TextSpan(
                                                text: "Masa aktif hingga*\n",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400
                                                )
                                              ),
                                              TextSpan(
                                                text: "02 Juni 2024",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500
                                                )
                                              )
                                            ]
                                          )
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                                    width: 1,
                                    height: 100,
                                    color: const Color(0xFFACC5FB),
                                  ),
                                  //card bagian kanan
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Penggunaan Internet",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 10
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "02 April 24 - 31 April 24",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 6,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                         const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "80,79 GB",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        
                                      ],
                                    )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //paket untuk anda section
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title paket untuk anda section
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.041
                        ),
                        child: Text(
                          "Paket Untuk Anda",
                          style: TextStyle(
                            color: C6,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      //slide view paket untuk anda section
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.047
                          ),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              4, (index1) {
                                return Row(
                                  children: [
                                    //card slide view
                                    Container(
                                      width: 130,
                                      height: 210,
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 7.5 
                                      ),
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                        color: C3,
                                        borderRadius: BorderRadius.circular(10) 
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          //title card view
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "Smart Home",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: C6,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500
                                                 )
                                                )
                                              ),
                                              const SizedBox(
                                                height: 7
                                              ),
                                              Text(
                                                "Kecepatan Upto 21 Mbps",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.w400
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 7
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 24 
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFBCD1FE),
                                                  borderRadius: BorderRadius.circular(6)
                                                ),
                                                child: Text(
                                                  "Cocok untuk :",
                                                  style: TextStyle(
                                                    color: C6,
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //product explanation card view
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,

                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/discount_icon.png",
                                                      width: 10,
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      " Paket Terlaris",
                                                      style: TextStyle(
                                                        color: C6,
                                                        fontSize: 7,
                                                        fontWeight: FontWeight.w400 
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: List.generate(
                                                    index1 +3, (index2) {
                                                      return Text(
                                                        "\u2022 Unlimitied tanpa quota",
                                                        style: TextStyle(
                                                          color: C6,
                                                          fontSize: 7,
                                                        ),
                                                      );
                                                    }),
                                                )
                                              ]
                                            ),
                                          ),
                                          //button and price card view
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "Rp.",
                                                        style: TextStyle(
                                                          color: C1,
                                                          fontSize: 5,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                            color: C1,
                                                          ),
                                                          children: const [
                                                            TextSpan(
                                                              text: "205.00,",
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w700
                                                              )
                                                            ),
                                                            TextSpan(
                                                              text: "-/bulan",
                                                              style: TextStyle(
                                                                fontSize: 7,
                                                                fontWeight: FontWeight.w700
                                                              )
                                                            )
                                                          ]
                                                        )
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4
                                              ),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context).size.width,
                                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                                child: ElevatedButton(
                                                  onPressed: (){},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: C9,
                                                    padding: const EdgeInsets.all(0)
                                                  ),
                                                  child: Text(
                                                    "Mulai Berlangganan",
                                                    style: TextStyle(
                                                      color: C3,
                                                      fontSize: 7,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                  )
                                                ),
                                              )
                                            ]
                                          )
                                        ],
                                      ),
                                    ),
                                    index1 != 4 - 1 ?
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.033,
                                    ) :
                                    const SizedBox()
                                  ],
                                );
                              })
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Recommendation section
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Column(
                    children: [
                      //title Recommendation section
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.041
                        ),
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
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.047
                            ),
                            child: Image.asset(
                              "assets/images/Image_Recomendation.png",
                              width: MediaQuery.of(context).size.width,
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
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
          ),
        )
      ],
    );
  }
}