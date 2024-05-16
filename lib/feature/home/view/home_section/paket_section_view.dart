import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../route/routes_name.dart';
import '../../../../theme/pallet_color.dart';
import '../../bloc/catalog_home_bloc/catalog_home_bloc.dart';
import '../../model/catalog_model.dart';
import '../../model/customer_model.dart';

class PaketHomeWidget extends StatefulWidget {
  const PaketHomeWidget({super.key, required this.customer});

  final Customer customer;

  @override
  State<PaketHomeWidget> createState() => _PaketHomeWidgetState();
}

class _PaketHomeWidgetState extends State<PaketHomeWidget> {
  List<Catalog> catalogs = [];

  @override
  void initState() {
    super.initState();
    context.read<CatalogHomeBloc>().add(CatalogHomeInitialEvent(widget.customer.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogHomeBloc, CatalogHomeState>(
      listener: (context, state) {
        if (state is CatalogHomeInitialFailureState) {
          showTopSnackBar(
            Overlay.of(context), CustomSnackBar.error(message: state.error));
        }
        if (state is CatalogHomeInitialSuccesstate) {
          catalogs = state.catalogs;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //title paket untuk anda section
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.041),
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
                horizontal: MediaQuery.of(context).size.width * 0.047),
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<CatalogHomeBloc, CatalogHomeState>(
                builder: (context, state) {
                 if (state is CatalogHomeInitialSuccesstate) {
                  return catalogs.isEmpty
                  ? Container(
                    height: MediaQuery.of(context).size.height * 0.29,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      "tidak ada data",
                      style: TextStyle(
                        color: C1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(catalogs.length, (index1) {
                      return Row(
                        children: [
                          //card slide view
                          Container(
                            width: MediaQuery.of(context).size.width * 0.425,
                            height: 260,
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: C3,
                              borderRadius: BorderRadius.circular(14)),
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                                          catalogs[index1].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: C6,
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight.w500
                                          )
                                        )
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        "Kecepatan ${catalogs[index1].speed}",
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      const SizedBox(height: 7),
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
                                    height:MediaQuery.of(context).size.height,
                                    margin: const EdgeInsets.only(top: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 17),
                                    child: Column(
                                      children: [
                                        catalogs[index1].tags != null
                                        ? Row(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          mainAxisAlignment:MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Image.asset(
                                              "assets/icons/discount_icon.png",
                                              width: 12.5,
                                              height: 13.5,
                                            ),
                                            Text(
                                              " ${catalogs[index1].tags}",
                                              style: TextStyle(
                                                color: C6,
                                                fontSize: 10,
                                                fontWeight:FontWeight.w400
                                              ),
                                            ),
                                          ],
                                        )
                                        : const SizedBox(),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(catalogs[index1].description.length, (index2) {
                                                if(catalogs[index1].description.isEmpty) {
                                                  return Center(
                                                    child: AutoSizeText(
                                                      "tidak ada data",
                                                      maxLines: 1,
                                                      minFontSize: 9,
                                                      overflow: TextOverflow.clip,
                                                      style: TextStyle(
                                                        color: C6,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  );
                                                } else if (index2 > 5) {
                                                  return const SizedBox();
                                                } else if (index2 > 4 && catalogs[index1].tags != null) {
                                                  return const SizedBox();
                                                } else {
                                                  return Column(
                                                    children: [
                                                      AutoSizeText(
                                                        " \u2022 ${catalogs[index1].description[index2]}",
                                                        maxLines: 1,
                                                        minFontSize: 9,
                                                        overflow: TextOverflow.clip,
                                                        style: TextStyle(
                                                          color: C6,
                                                          fontSize: 9.5,
                                                        ),
                                                      ),
                                                      index2 !=  catalogs[index1].description.length - 1
                                                      ? const SizedBox(
                                                        height: 1.5,
                                                      )
                                                      : const SizedBox()
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
                                                    text: NumberFormat(",###","id_ID").format(catalogs[index1].price),
                                                    style: const TextStyle(
                                                      fontSize: 15.5,
                                                      fontWeight: FontWeight.w700
                                                    )
                                                  ),
                                                  const TextSpan(
                                                    text: ",-/bulan",
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
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 24,
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(horizontal: 12),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, DETAILCATALOGHOME, arguments: catalogs[index1]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: C9,
                                          padding: const EdgeInsets.all(0)),
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
                          index1 != catalogs.length - 1
                          ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.041,
                          )
                          : const SizedBox()
                        ],
                      );
                    })
                  );
                 }
                 if (state is CatalogHomeInitialProccesState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.29,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: C1,
                    ),
                  );
                 }
                 return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: MediaQuery.of(context).size.width,
                 );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
