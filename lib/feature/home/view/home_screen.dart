import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
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
double dataChart = 92.38;
  List<String> title =["Smart Home","Starter","Home","Professional"];
  List<String> speed =["21 Mbps","11 Mbps","16 Mbps","31 Mbps",];
  List<String> deskripsi =["Unlimeted tanpa Quota","Media Sosial","Streaming Film","Main Game","Content Creator","UMKM & Bisnis"];
  List<String> harga =["205.000","165.000","185.000","250.000"];
  int indexRecomendation = 0;

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
                          const Color(0xFF0B3194).withOpacity(0.0),
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
                          sigmaX: 10 * 4,
                          sigmaY: 10 * 2
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
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          // color: Colors.blue,
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
                                                  fontSize: 12
                                                )
                                              ),
                                              TextSpan(
                                                text: "sec",
                                                style: TextStyle(
                                                  fontSize: 10
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
                                    height: 105,
                                    color: const Color(0xFFACC5FB),
                                  ),
                                  //card bagian tengah
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Tagihan Internet",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 11
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.255,
                                          child: AutoSizeText(
                                            "Rp 205,000",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: C3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                            )
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: C3,
                                              fontSize: 10
                                            ),
                                            children: const [
                                              TextSpan(
                                                text: "Masa aktif hingga*\n",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300
                                                )
                                              ),
                                              TextSpan(
                                                text: "02 September 2024",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400
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
                                    height: 105,
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
                                            fontSize: 11
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          "02 Desember 24 -\n31 Januari 25",
                                          style: TextStyle(
                                            color: C3,
                                            fontSize: 7.5,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                         const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.255,
                                          child: AutoSizeText(
                                            "380,79 GB",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: C3,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500
                                            ),
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
                              title.length, (index1) {
                                debugPrint("${MediaQuery.of(context).size.height * 0.31}");
                                return Row(
                                  children: [
                                    //card slide view
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      height: 255,
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 10 
                                      ),
                                      alignment: Alignment.topCenter,
                                      decoration: BoxDecoration(
                                        color: C3,
                                        borderRadius: BorderRadius.circular(14) 
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          //title card view
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  alignment: Alignment.topCenter,
                                                  child: AutoSizeText(
                                                    title[index1],
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: C6,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                   )
                                                  )
                                                ),
                                                const SizedBox(
                                                  height: 3
                                                ),
                                                Text(
                                                  "Kecepatan Upto ${speed[index1]}",
                                                  style: TextStyle(
                                                    color: C6,
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  alignment: Alignment.center,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFBCD1FE),
                                                    borderRadius: BorderRadius.circular(9)
                                                  ),
                                                  child: Text(
                                                    "Cocok untuk :",
                                                    style: TextStyle(
                                                      color: C6,
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //product explanation card view
                                          Expanded(
                                            child: Container(
                                              height: MediaQuery.of(context).size.height,
                                              // color: Colors.blue,
                                              margin: const EdgeInsets.only(top: 8),
                                              padding: const EdgeInsets.symmetric(horizontal: 17),
                                              child: Column(
                                                children: [
                                                  index1 <= 1 ?
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Image.asset(
                                                        "assets/icons/discount_icon.png",
                                                        width: 12.5,
                                                        height: 13.5,
                                                      ),
                                                      Text(
                                                        " Paket Terlaris",
                                                        style: TextStyle(
                                                          color: C6,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400 
                                                        ),
                                                      ),
                                                    ],
                                                  ):
                                                  const SizedBox(),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      // color: Colors.red,
                                                      alignment: Alignment.centerLeft,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: List.generate(
                                                          index1 +5, (index2) {
                                                            if(index2 > 5){
                                                              return const SizedBox();
                                                            } else if (index2 > 4 && index1 <=1){
                                                              return const SizedBox();
                                                            } 
                                                            else {
                                                              return Column(
                                                                children: [
                                                                  Text(
                                                                    " \u2022 ${deskripsi[index2]}",
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: TextStyle(
                                                                      color: C6,
                                                                      fontSize: 9,
                                                                    ),
                                                                  ),
                                                                  index2 !=  index1 + 3 - 1 ?
                                                                  const SizedBox(
                                                                    height: 1.5,
                                                                  ):
                                                                  const SizedBox()
                                                                ],
                                                              );
                                                            }
                                                          }),
                                                      ),
                                                    ),
                                                  )
                                                ]
                                              ),
                                            ),
                                          ),
                                          //button and price card view
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        "Rp.",
                                                        style: TextStyle(
                                                          color: C1,
                                                          fontSize: 9,
                                                          fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      alignment: Alignment.centerRight,
                                                      child: AutoSizeText.rich(
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        minFontSize: 10,
                                                        TextSpan(
                                                          style: TextStyle(
                                                            color: C1,
                                                          ),
                                                          children: [
                                                            TextSpan(
                                                              text: "${harga[index1]},",
                                                              style: const TextStyle(
                                                                fontSize: 15.5,
                                                                fontWeight: FontWeight.w700
                                                              )
                                                            ),
                                                            const TextSpan(
                                                              text: "-/bulan",
                                                              style: TextStyle(
                                                                fontSize: 10,
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
                                                height: 24,
                                                width: MediaQuery.of(context).size.width,
                                                margin: const EdgeInsets.symmetric(horizontal: 12),
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
                                                      fontSize: 9.5,
                                                      fontWeight: FontWeight.w500
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
                                      width: MediaQuery.of(context).size.width * 0.041,
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
                          onPageChanged: (index, reason) {
                            setState(() {
                              indexRecomendation = index;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.only(left: index == 0 ? 0 : 7 ),
                              decoration: BoxDecoration(
                                color: index == indexRecomendation ? Colors.blue : Colors.grey,
                                borderRadius: BorderRadius.circular(99)
                              ),
                            );
                          })
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