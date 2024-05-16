import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';

import '../../../../theme/pallet_color.dart';
import '../../../billing/model/billing_model.dart';
import '../../bloc/card_home_bloc/card_home_bloc.dart';
import '../../model/catalog_model.dart';
import '../../model/customer_model.dart';


class CardHomeWidget extends StatefulWidget {
  const CardHomeWidget({super.key, required this.customer});
  final Customer customer;

  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {
  Catalog? catalog;
  BillingModel? billingModel;
  String? speed;

  @override
  void initState() {
    super.initState();
    context.read<CardHomeBloc>().add(CardHomeInitialEvent(widget.customer.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardHomeBloc, CardHomeState>(
      listener: (context, state) {
        if (state is CardHomeInitialFailureState) {
          showTopSnackBar(
            Overlay.of(context), CustomSnackBar.error(message: state.error));
        }
        if (state is CardHomeInitialSuccesstate) {
          catalog = state.catalog;
          billingModel = state.billingModel;
          speed = state.speed;
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.041),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  const Color(0xFF0B3194).withOpacity(0.0),
                  const Color(0xFF208CDA).withOpacity(0.94)
                ]),
            border: Border.all(color: const Color(0xFF0971A6), width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10 * 4, sigmaY: 10 * 2),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12 +((MediaQuery.of(context).size.width * 0.055) * 2),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.055),
              child: BlocBuilder<CardHomeBloc, CardHomeState>(
                builder: (context, state) {
                  if(state is CardHomeInitialProccesState){
                   return Center(child: CircularProgressIndicator(color: C3));
                  } 
                  if(state is CardHomeInitialSuccesstate || state is CardHomeInitialFailureState){
                    return Row(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.255,
                                  child: AutoSizeText(
                                      "Paket yang\ndigunakan saat ini",
                                      maxLines: 2,
                                      minFontSize: 8,
                                      style: TextStyle(
                                          color: C3,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.255,
                                  child: AutoSizeText(
                                    catalog != null ? catalog!.name : "Tidak Ada Data",
                                    minFontSize: 10,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: C3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          )),
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
                            // color: Colors.red,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.255,
                                      child: AutoSizeText(
                                        billingModel != null 
                                        ? "Rp. ${NumberFormat(",###","id_ID").format(billingModel!.grandTotal)}" 
                                        : "tidak ada data",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: C3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                RichText(
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    text: TextSpan(
                                        style:
                                            TextStyle(color: C3, fontSize: 10),
                                        children: [
                                          const TextSpan(
                                              text: "Masa aktif hingga*\n",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300)),
                                          TextSpan(
                                              text: billingModel != null 
                                              ? DateFormat("d MMMM y","id_ID").format(billingModel!.dueDate)
                                              : "tidak ada Data",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400))
                                        ])),
                              ],
                            ),
                          )),
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
                            // color: Colors.red,
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
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.255,
                                      child: AutoSizeText(
                                        speed != null
                                        ? speed!
                                        : 'tidal ada data',
                                          maxLines: 1,
                                          minFontSize: 12,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: C3,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Text(
                                      "Mbps/sec",
                                      style: TextStyle(
                                          color: C3,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                    );
                  }
                  return const Center();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
