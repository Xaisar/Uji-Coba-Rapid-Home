import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isp_management_app/route/routes_name.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';

import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../billing/model/billing_model.dart';
import '../../payment/bloc/payment/payment_bloc.dart';
import '../../payment/bloc/payment_detail/payment_detail_bloc.dart';
import '../../payment/bloc/payment_method/payment_method_bloc.dart';
import '../../payment/model/payment_method_model.dart';
import '../bloc/detail_billing_bloc.dart';
import 'payment_section/payment_active_view.dart';
import 'payment_section/payment_done_view.dart';
import 'payment_section/payment_posted_view.dart';
import 'payment_section/select_payment_method_view.dart';

class DetailBillingScreen extends StatelessWidget {
  const DetailBillingScreen({super.key, required this.billingModel});
  final BillingModel billingModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailBillingBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentMethodBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentDetailBloc(),
        ),
      ],
      child: DetailBillingView(
        billingModel: billingModel,
      ),
    );
  }
}

class DetailBillingView extends StatefulWidget {
  const DetailBillingView({super.key, required this.billingModel});
  final BillingModel billingModel;
  @override
  State<DetailBillingView> createState() => _DetailBillingViewState();
}

class _ClampingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();
}

class _DetailBillingViewState extends State<DetailBillingView> {
  List<PaymentMethod> paymentMethods = [];

  @override
  void initState() {
    super.initState();
    context.read<DetailBillingBloc>().add(
      DetailBillingInitialEvent(widget.billingModel.id)
    );
    context.read<PaymentMethodBloc>().add(
      InitialPaymentMethodEvent(widget.billingModel.id)
    );
    context.read<PaymentDetailBloc>().add(
      InitialDetailPaymentEvent(widget.billingModel.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return Scaffold(
      backgroundColor: C20,
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        title: Text(
          "Detail Billing",
          style:
              TextStyle(fontSize: 19, color: C3, fontWeight: FontWeight.bold),
        ),
        backgroundColor: C1,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DetailBillingBloc, DetailBillingState>(
            listener: (context, state) {
              if (state is DetailBillingInitialFailureState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.error)
                );
              }
              if (state is DetailBillingExpiredTokenState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.message)
                );
                authenticationBloc.add(UnAuthenticationEvent());
              }
            },
          ),
          BlocListener<PaymentDetailBloc, PaymentDetailState>(
            listener: (context, state) {
              debugPrint(state.toString());
              if(state is PaymentDetailFailureState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.error)
                );
              }
              if(state is PaymentDetailExpiredTokenState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.message)
                );
                authenticationBloc.add(UnAuthenticationEvent());
              }
            },
          ),
          BlocListener<PaymentMethodBloc, PaymentMethodState>(
            listener: (context, state) {
              if (state is PaymentMethodSuccesState) {
                paymentMethods = state.paymentMethods;
              }
              if (state is PaymentMethodFailureState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.error)
                );
              }
              if (state is PaymentMethodExpiredTokenState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.message)
                );
                authenticationBloc.add(UnAuthenticationEvent());
              }
            },
          ),
          BlocListener<PaymentBloc, PaymentState>(
            listener: (context, state) {
              if(state is PaymentProccesState) {
                showDialog(
                context: context, 
                builder: (context) => PopScope(
                  canPop: false,
                  child: Scaffold(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    body: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
              }
              if(state is PaymentProccesDoneState) {
                Navigator.pop(context);
              }
              if(state is PaymentSuccesState) {
                Navigator.pop(context);
                context.read<DetailBillingBloc>().add(
                  DetailBillingInitialEvent(widget.billingModel.id)
                );
                context.read<PaymentMethodBloc>().add(
                  InitialPaymentMethodEvent(widget.billingModel.id)
                );
                context.read<PaymentDetailBloc>().add(
                  InitialDetailPaymentEvent(widget.billingModel.id)
                );
              }
              if(state is PaymentFailureState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.error)
                );
              }
              if(state is CancelPaymentSuccesState) {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.success(message: "Pembayaran berhasil dibatalkan")
                );
                context.read<DetailBillingBloc>().add(
                  DetailBillingInitialEvent(widget.billingModel.id)
                );
                context.read<PaymentMethodBloc>().add(
                  InitialPaymentMethodEvent(widget.billingModel.id)
                );
                context.read<PaymentDetailBloc>().add(
                  InitialDetailPaymentEvent(widget.billingModel.id)
                );
              }
              if(state is CancelPaymentFailureState) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.error)
                );
              }
              if(state is PaymentExpiredToken) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(message: state.message)
                );
                authenticationBloc.add(UnAuthenticationEvent());
              }
            },
          ),
        ],
        child: BlocBuilder<DetailBillingBloc, DetailBillingState>(
          builder: (context, state) {
            if (state is DetailBillingInitialFailureState) {
              return Center(
                child: Text(
                  'Tidak ada Data', 
                  style: TextStyle(color: C1)
                )
              );
            }
            if (state is DetailBillingInitialSuccesState) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  //body
                  Align(
                    alignment: Alignment.topCenter,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<DetailBillingBloc>().add(
                          DetailBillingInitialEvent(widget.billingModel.id)
                        );
                        context.read<PaymentMethodBloc>().add(
                          InitialPaymentMethodEvent(widget.billingModel.id)
                        );
                        context.read<PaymentDetailBloc>().add(
                          InitialDetailPaymentEvent(widget.billingModel.id)
                        );
                      },
                      child: ScrollConfiguration(
                        behavior: _ClampingScrollBehavior(),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //keterangan
                                Container(
                                  color: C3,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                  child: Column(
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
                                              state.detailBilling.customerName,
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
                                              state.detailBilling.billNumber,
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
                                              DateFormat("d MMMM y", 'id_ID').format(state.detailBilling.dueDate),
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
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text("Status",
                                              style: TextStyle(
                                                color: C10,
                                                fontSize: 12,
                                              )
                                            ),
                                            state.detailBilling.grandTotal - state.detailBilling.totalPaid == 0
                                            ? const Text(
                                              "Lunas",
                                              style: TextStyle(
                                                color: Color(0xFF147638),
                                                fontSize: 12,
                                                fontWeight:FontWeight.w600
                                              )
                                            )
                                            : const Text(
                                              "Belum Lunas",
                                              style: TextStyle(
                                                color: Color(0xFFB4173A),
                                                fontSize: 12,
                                                fontWeight:FontWeight.w600
                                              )
                                            ),
                                          ],
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                //sub total
                                const SizedBox(height: 2.5),
                                Container(
                                  color: C3,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13, 
                                    vertical: 10
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
                                        "Rp. ${NumberFormat(',###', 'id_ID').format(state.detailBilling.total)}",
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
                                const SizedBox(height: 2.5),
                                Container(
                                  color: C3,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13, 
                                    vertical: 10
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
                                        "Rp. ${NumberFormat(',###', 'id_ID').format(state.detailBilling.tax)}",
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
                                const SizedBox(height: 2.5),
                                Container(
                                  color: C3,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13, 
                                    vertical: 10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total Tagihan",
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                      Text(
                                        "Rp. ${NumberFormat(',###', 'id_ID').format(state.detailBilling.grandTotal)}",
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
                                const SizedBox(height: 2.5),
                                Container(
                                  color: C3,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13, 
                                    vertical: 10
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
                                        "Rp. ${NumberFormat(',###', 'id_ID').format(state.detailBilling.totalPaid)}",
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                                //Payment
                                const SizedBox(height: 6),
                                BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                                  builder: (context, stateDetail) {
                                    if(stateDetail is PaymentDetailDoneState) {
                                      return const PaymentDoneView();
                                    }
                                    if(stateDetail is PaymentDetailActiveState) {
                                      return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                                        builder: (context, stateMethod) {
                                          if (stateMethod is PaymentMethodSuccesState) {
                                            List<PaymentMethod> currentMethod = stateMethod.paymentMethods.where((element) => element.value == stateDetail.paymentDetail.meta!.customField1).toList();
                                            return PaymentActiveView(
                                              paymentDetail: stateDetail.paymentDetail,
                                              paymentMethod:  currentMethod[0]
                                            );
                                          }
                                          return const SizedBox();
                                        } 
                                      );
                                    }
                                    if(stateDetail is PaymentDetailPostedState) {
                                      return const PaymentPostedView();
                                    }
                                    return const SizedBox();
                                  },
                                ),
                                //padding bawah
                                const SizedBox(
                                  height: 75,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    )
                  ),                 
                  //bottom button
                  BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                    builder: (context, state) {
                      //cancel payment
                      if (state is PaymentDetailActiveState) {
                        return Align(
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
                            child: BlocBuilder<PaymentBloc, PaymentState>(
                              builder: (context, state) {
                                if(state is CancelPaymentProccesState) {
                                  return ElevatedButton(
                                    onPressed: null,
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      backgroundColor: C3,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(color: Color(0xFFE11C1C), width: 2),
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFFE11C1C),
                                        ),
                                      ),
                                    )
                                  );
                                }
                                return ElevatedButton(
                                  onPressed: () {
                                    paymentBloc.add(CancelPaymentEvent(widget.billingModel.id));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    backgroundColor: C3,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Color(0xFFE11C1C), width: 2),
                                      borderRadius: BorderRadius.circular(10)
                                    )
                                  ),
                                  child: const Text(
                                    "Batalkan Pembayaran",
                                    style: TextStyle(
                                      color: Color(0xFFE11C1C),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                );
                              }
                            )
                          ),
                        );
                      }
                      //send payment
                      if (state is PaymentDetailPostedState) {
                        return Align(
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
                              onPressed: () {
                                showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      insetPadding: const EdgeInsets.all(0),
                                      elevation: 0,
                                      backgroundColor: C3,
                                      child: SelectPaymentMethodView(
                                        paymentMethod: paymentMethods,
                                        paymentBloc: paymentBloc,
                                        billId: widget.billingModel.id,
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: C9,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: C9, width: 2),
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
                        );
                      }
                      return const SizedBox();                      
                    },
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: C1,
              )
            );
          },
        ),
      ),
    );
  }
}
