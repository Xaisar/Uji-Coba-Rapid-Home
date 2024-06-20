import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../home/model/catalog_model.dart';
import '../bloc/detail_catalog_bloc.dart';

class DetailCatalogScreen extends StatelessWidget{
  const DetailCatalogScreen({
    super.key,
    required this.catalog
  });
  final Catalog catalog;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCatalogBloc(),
      child: DetailCatalogView(catalog: catalog) ,
    );
  }
}

class DetailCatalogView extends StatefulWidget{
  const DetailCatalogView({
    super.key,
    required this.catalog
  });
  final Catalog catalog;
  @override
  State<DetailCatalogView> createState() => _DetailCatalogViewState();
}

class _DetailCatalogViewState extends State<DetailCatalogView> {
  
  @override
  void initState() {
    super.initState();
    context.read<DetailCatalogBloc>().add(DetailCatalogInitialEvent(widget.catalog.id));
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context); 

    return Scaffold(
      backgroundColor: C20,
      body: Stack(
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
          //Frontend
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Detail Paket",
                style: TextStyle(
                  color: C3,
                  fontSize: 19,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
            body: BlocConsumer<DetailCatalogBloc, DetailCatalogState>(
              listener:(context, state) {
                if(state is DetailCatalogInitialFailureState){
                  showTopSnackBar(Overlay.of(context),
                  CustomSnackBar.error(message: state.error));
                }
                if(state is DetailCatalogExpiredTokenState){
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: state.message)
                  );
                  authenticationBloc.add(UnAuthenticationEvent());
                }
              },
              builder: (context, state) {
                if(state is DetailCatalogInitialFailureState) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      //body
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.0186,
                            horizontal: MediaQuery.of(context).size.width * 0.0555
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //tittle
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "tidak ada data",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0248),
                              //card
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: C3,
                                  border: Border.all(
                                    color: const Color(0xFFAFACAC)
                                  ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          //name
                                          Text(
                                            "tidak ada data",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 16,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  );
                }
                if(state is DetailCatalogInitialSuccesState) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      //body
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.0186,
                            horizontal: MediaQuery.of(context).size.width * 0.0555
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //tittle
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      state.detailCatalog.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  state.detailCatalog.tags != null
                                  ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                      horizontal: 7
                                    ),
                                    decoration: BoxDecoration(
                                      color: C3,
                                      borderRadius: BorderRadius.circular(99)
                                    ),
                                    child: Row(
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          "assets/icons/discount_icon.png",
                                          width: 12.5 * 1.5,
                                          height: 13.5 * 1.5,
                                        ),
                                        Text(
                                          " ${state.detailCatalog.tags}",
                                          style: TextStyle(
                                            color: C6,
                                            fontSize: 12,
                                            fontWeight:FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : const SizedBox(),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0248),
                              //card
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: C3,
                                  border: Border.all(
                                    color: const Color(0xFFAFACAC)
                                  ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/speed_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " Speed",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${state.speed} Mbps",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/isp_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " ISP",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            state.detailCatalog.merchant.name,
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/price_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " Harga",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Rp. ${NumberFormat(",###","id_ID").format(state.detailCatalog.price)}",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //name
                                          Text(
                                            "Deskripsi",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 16,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(state.detailCatalog.description.length, (index) {
                                              return Column(
                                                children: [
                                                  Text(
                                                    "\u2022 ${state.detailCatalog.description[index]}",
                                                    style: TextStyle(
                                                      color: C6,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w300
                                                    ),
                                                  ),
                                                  index != state.detailCatalog.description.length -1
                                                  ? const SizedBox(height: 3)
                                                  : const SizedBox()
                                                ],
                                              );
                                            })
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 90,
                              ),
                            ],
                          ),
                        )
                      ),
                      //button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: C3,
                            boxShadow: [
                              BoxShadow(
                                color: C6.withOpacity(0.4),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                              )
                            ]
                          ),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C9,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99)
                              )
                            ),
                            child: Text(
                              "Mulai berlangganan",
                              style: TextStyle(
                                color: C3,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  );
                }
                return Skeletonizer(
                  enabled: true,
                  effect: ShimmerEffect(highlightColor: HomeShimmerColor),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      //button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: C3,
                            boxShadow: [
                              BoxShadow(
                                color: C6.withOpacity(0.4),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                              )
                            ]
                          ),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C9,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99)
                              )
                            ),
                            child: Text(
                              "Mulai berlangganan",
                              style: TextStyle(
                                color: C3,
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        )
                      ),
                      //body
                      SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.0186,
                            horizontal: MediaQuery.of(context).size.width * 0.0555
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //tittle
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Smart Home",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                      horizontal: 5
                                    ),
                                    decoration: BoxDecoration(
                                      color: C3,
                                      borderRadius: BorderRadius.circular(99)
                                    ),
                                    child: Row(
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          "assets/icons/discount_icon.png",
                                          width: 12.5 * 1.5,
                                          height: 13.5 * 1.5,
                                        ),
                                        Text(
                                          " Paket Murah",
                                          style: TextStyle(
                                            color: C6,
                                            fontSize: 12,
                                            fontWeight:FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0248),
                              //card
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color: C3,
                                  border: Border.all(
                                    color: const Color(0xFFAFACAC)
                                  ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/speed_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " Speed",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "20 Mbps",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/isp_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " ISP",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Merchant Dev",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFAFACAC)
                                          )
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //name
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/icons/price_icon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              Text(
                                                " Harga",
                                                style: TextStyle(
                                                  color: C6,
                                                  fontSize: 16,
                                                  fontWeight:FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Rp. 250.000",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 14,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal: 15
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //name
                                          Text(
                                            "Deskripsi",
                                            style: TextStyle(
                                              color: C6,
                                              fontSize: 16,
                                              fontWeight:FontWeight.w400
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: List.generate(4, (index) {
                                              return Column(
                                                children: [
                                                  Text(
                                                    "\u2022 Paket murah dan banyak",
                                                    style: TextStyle(
                                                      color: C6,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w300
                                                    ),
                                                  ),
                                                  index != 4 -1
                                                  ? const SizedBox(height: 3)
                                                  : const SizedBox()
                                                ],
                                              );
                                            })
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}