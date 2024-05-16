import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';

import '../../../theme/pallet_color.dart';
import '../../billing/model/billing_model.dart';
import '../bloc/detail_billing_bloc.dart';
import '../model/detail_billing_model.dart';

class DetailBillingScreen extends StatelessWidget{
  const DetailBillingScreen({
    super.key,
    required this.billingModel  
  });
  final BillingModel billingModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBillingBloc(),
      child: DetailBillingView(billingModel: billingModel,),
    );
  }
}

class DetailBillingView extends StatefulWidget{
  const DetailBillingView({
    super.key,
    required this.billingModel
  });
  final BillingModel billingModel;
  @override
  State<DetailBillingView> createState() => _DetailBillingViewState();
}

class _DetailBillingViewState extends State<DetailBillingView> {
  DetailBilling? detailBilling;

  @override
  void initState() {
    super.initState();
    context.read<DetailBillingBloc>().add(DetailBillingInitialEvent(widget.billingModel.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C20,
      appBar: AppBar(
        title: const Text("Detail Billing"),
        backgroundColor: C1,
      ),
      body: BlocConsumer<DetailBillingBloc, DetailBillingState>(
        listener: (context, state) {
          if(state is DetailBillingInitialFailureState){
            showTopSnackBar(Overlay.of(context),
            CustomSnackBar.error(message: state.error));
          }
          if(state is DetailBillingInitialSuccesState){
            detailBilling = state.detailBilling;
          }
        },
        builder: (context, state) {
          if(state is DetailBillingInitialFailureState){
            return const Center();
          }
          if(state is DetailBillingInitialSuccesState){
            return detailBilling == null 
            ? Center(child: Text('Tidak ada Data', style: TextStyle(color: C1)))
            : Stack(
              fit: StackFit.expand,
              children: [
                //body
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //keterangan
                          Container(
                            color: C3,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 13
                            ),
                            child: 
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keterangan",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                //nama
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Atas Nama",
                                        style: TextStyle(
                                          color: C10,
                                          fontSize: 12,
                                        )
                                      ),
                                      Text(
                                        detailBilling!.customerName,
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  )
                                ),
                                //bill number
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Nomor Billing",
                                        style: TextStyle(
                                          color: C10,
                                          fontSize: 12,
                                        )
                                      ),
                                      Text(
                                        detailBilling!.billNumber,
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  )
                                ),
                                //Tenggat Waktu
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Tenggat Waktu",
                                        style: TextStyle(
                                          color: C10,
                                          fontSize: 12,
                                        )
                                      ),
                                      Text(
                                        DateFormat("d MMMM y", 'id_ID').format(detailBilling!.dueDate),
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  )
                                ),
                                //status
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                          color: C10,
                                          fontSize: 12,
                                        )
                                      ),
                                      detailBilling!.grandTotal - detailBilling!.totalPaid == 0
                                      ? const Text(
                                        "Lunas",
                                        style: TextStyle(
                                          color:Color(0xFF1BD717),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      )
                                      : const Text(
                                        "Belum Lunas",
                                        style: TextStyle(
                                          color: Color(0xFFDC1B1B),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                          //sub total
                          const SizedBox(
                            height: 3
                          ),
                          Container(
                            color: C3,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 13
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                Text(
                                  "Rp. ${NumberFormat(',###','id_ID').format(detailBilling!.total)}",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            ),
                          ),
                          //tax
                          const SizedBox(
                            height: 3
                          ),
                          Container(
                            color: C3,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 13
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tax",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                Text(
                                  "Rp. ${NumberFormat(',###','id_ID').format(detailBilling!.tax)}",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            ),
                          ),
                          //total tagihan
                          const SizedBox(
                            height: 3
                          ),
                          Container(
                            color: C3,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 13
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Tagihan",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                Text(
                                  "Rp. ${NumberFormat(',###','id_ID').format(detailBilling!.grandTotal)}",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            ),
                          ),
                          //total Pembayaran
                          const SizedBox(
                            height: 3
                          ),
                          Container(
                            color: C3,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 13
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Paid",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                Text(
                                  "Rp. ${NumberFormat(',###','id_ID').format(detailBilling!.totalPaid)}",
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //bottom button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 13
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12
                        ),
                        backgroundColor: C9,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: C9,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: Text(
                        "Pembayaran",
                        style: TextStyle(
                          color: C3,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator(color: C1,));
        },
      ),
    );
  }
}