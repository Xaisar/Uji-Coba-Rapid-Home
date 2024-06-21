import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../theme/pallet_color.dart';
import '../../../authentication/bloc/authentication_bloc.dart';
import '../../bloc/card_home_bloc/card_home_bloc.dart';
import '../../../homeIndex/model/customer_model.dart';


class CardHomeWidget extends StatefulWidget {
  const CardHomeWidget({super.key, required this.customer});
  final Customer customer;

  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {

  @override
  void initState() {
    super.initState();
    if(context.read<CardHomeBloc>().state is! CardHomeInitialSuccesState ){
      context.read<CardHomeBloc>().add(CardHomeInitialEvent(widget.customer.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocConsumer<CardHomeBloc, CardHomeState>(
      listener: (context, state) {
        if (state is CardHomeInitialFailureState) {
          showTopSnackBar(
            Overlay.of(context), CustomSnackBar.error(message: state.error)
          );
        }
        if (state is CardHomeExpiredTokenState) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.message)
          );
          authenticationBloc.add(UnAuthenticationEvent());
        }
      },
      builder:(context, state) {
        if (state is CardHomeInitialSuccesState || state is CardHomeInitialFailureState) {
          return Container( 
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
              border: Border.all(color: const Color(0xFF0971A6), width: 2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10 * 4, sigmaY: 10 * 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12 + ((MediaQuery.of(context).size.width * 0.055) * 2),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //card bagian kiri
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.255,
                                child: AutoSizeText(
                                  "Paket yang\ndigunakan saat ini",
                                  maxLines: 2,
                                  minFontSize: 8,
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width * 0.255,
                                child: state is CardHomeInitialSuccesState 
                                 ? AutoSizeText(
                                  state.catalog != null 
                                  ? state.catalog!.name
                                  : "tidak ada data", 
                                  minFontSize: 10,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                                : AutoSizeText(
                                  "tidak ada data", 
                                  minFontSize: 10,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              )
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: const Color(0xFFACC5FB),
                      ),
                      //card bagian tengah
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Tagihan Internet",
                                    maxLines: 1,
                                    minFontSize: 8,
                                    style: TextStyle(color: C3, fontSize: 10),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.255,
                                    child: state is CardHomeInitialSuccesState
                                    ? AutoSizeText( 
                                      state.billingModel != null 
                                      ? "Rp. ${NumberFormat(",###","id_ID").format(state.billingModel!.grandTotal)}"
                                      : "Rp. ${NumberFormat(",###","id_ID").format(0)}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      )
                                    )
                                    : AutoSizeText( 
                                      "Rp. ${NumberFormat(",###","id_ID").format(0)}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.255,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText( 
                                      "Masa aktif hingga*",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300
                                      )
                                    ),
                                    state is CardHomeInitialSuccesState
                                    ? AutoSizeText( 
                                      state.billingModel != null 
                                      ? DateFormat("d MMMM y","id_ID").format(state.billingModel!.dueDate)
                                      : "tidak ada data",
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500
                                      )
                                    )
                                    : AutoSizeText( 
                                      "tidak ada data",
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: const Color(0xFFACC5FB),
                      ),
                      //card bagian kanan
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Up to",
                                style: TextStyle(
                                  color: C3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.255,
                                    child: state is CardHomeInitialSuccesState 
                                    ? AutoSizeText(
                                      state.speed != null
                                      ? state.speed!
                                      : "0",
                                      maxLines: 1,
                                      minFontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400
                                      )
                                    )
                                    : AutoSizeText(
                                      "0",
                                      maxLines: 1,
                                      minFontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400
                                      )
                                    ) ,
                                  ),
                                  Text(
                                    "Mbps/sec",
                                    style: TextStyle(
                                      color: C3,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  )
                ),
              ),
            ),
          );
        }
        return Skeletonizer(
          enabled: true,
          effect: ShimmerEffect(highlightColor: HomeShimmerColor),
          child: Container( 
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
              border: Border.all(color: const Color(0xFF0971A6), width: 2),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10 * 4, sigmaY: 10 * 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12 +((MediaQuery.of(context).size.width * 0.055) * 2),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //card bagian kiri
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          // color: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.255,
                                child: AutoSizeText(
                                  "Paket yang\ndigunakan saat ini",
                                  maxLines: 2,
                                  minFontSize: 8,
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width * 0.255,
                                child: AutoSizeText(
                                  "Smart Home",
                                  minFontSize: 10,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: C3,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: const Color(0xFFACC5FB),
                      ),
                      //card bagian tengah
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tagihan Internet",
                                    style: TextStyle(color: C3, fontSize: 10),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.255,
                                    child: AutoSizeText(
                                      "Rp. ${NumberFormat(",###","id_ID").format(1000000)}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                text: TextSpan(
                                  style: TextStyle(color: C3, fontSize: 10),
                                  children: [
                                    const TextSpan(
                                      text: "Masa aktif hingga*\n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300
                                      )
                                    ),
                                    TextSpan(
                                      text: DateFormat("d MMMM y","id_ID").format(DateTime.now()),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400
                                      )
                                    )
                                  ]
                                )
                              ),
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        color: const Color(0xFFACC5FB),
                      ),
                      //card bagian kanan
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Up to",
                                style: TextStyle(
                                  color: C3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.255,
                                    child: AutoSizeText(
                                      "99",
                                      maxLines: 1,
                                      minFontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: C3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400
                                      )
                                    ),
                                  ),
                                  Text(
                                    "Mbps/sec",
                                    style: TextStyle(
                                      color: C3,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      }, 
    );
  }
}
