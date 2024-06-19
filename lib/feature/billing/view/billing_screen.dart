import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';

import '../../../route/routes_name.dart';
import '../../../theme/pallet_color.dart';
import '../../authentication/bloc/authentication_bloc.dart';
import '../../homeIndex/model/customer_model.dart';
import '../bloc/billing_bloc.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key, required this.customer});
  final Customer customer;

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {

  @override
  void initState() {
    super.initState();
    if(context.read<BillingBloc>().state is! GetBillingSuccesState){
      context.read<BillingBloc>().add(InitialBillingEvent(widget.customer));
    }
  }

  @override
  Widget build(BuildContext context) {
    final billingBloc = BlocProvider.of<BillingBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.transparent, 
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: C1,
          centerTitle: true,
          title: Text(
            "Billing",
            style: TextStyle(
              fontSize: 18,
              color: C3, 
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.032,
        ),
        child: BlocConsumer<BillingBloc, BillingState>(
          listener: (context, state) {
            if(state is GetBillingFailureState){
              showTopSnackBar(Overlay.of(context),
                CustomSnackBar.error(message: state.error));
            }
            if(state is BillingExpiredTokenState) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(message: state.message)
              );
              authenticationBloc.add(UnAuthenticationEvent());
            }
          },
          builder: (context, state) {
            if(state is GetBillingFailureState){
              Center(
                child: RefreshIndicator(
                  onRefresh: () async {
                    billingBloc.add(InitialBillingEvent(widget.customer));
                  },
                  child: Text(
                    "Tidak ada Data",
                    style: TextStyle(
                      color: C1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              );
            }
            if(state is GetBillingSuccesState){
              return state.billings.isEmpty
              ? RefreshIndicator(
                onRefresh: () async {
                  billingBloc.add(InitialBillingEvent(widget.customer));
                },
                child: Center(
                  child: Text(
                    "Tidak ada Data",
                    style: TextStyle(
                      color: C1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
              : RefreshIndicator(
              onRefresh: () async {
                billingBloc.add(InitialBillingEvent(widget.customer));
              },
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: state.billings.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10,
                    color: Colors.transparent,
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      index == 0 
                      ? const Divider(
                        height: 12,
                        color: Colors.transparent,
                      ) 
                      : const SizedBox(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DETAILBILLING, arguments: state.billings[index]);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          decoration: BoxDecoration(
                            color: C1,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7
                            ),
                            decoration: BoxDecoration(
                              color: C3,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //bill number and tags status
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          state.billings[index].billNumber,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            color: C6,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      state.billings[index].grandTotal - state.billings[index].totalPaid == 0
                                      ? Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5
                                        ),
                                        decoration: BoxDecoration(
                                          color:  const Color(0xFFF2FDF5 * 2),
                                          borderRadius: BorderRadius.circular(99)
                                        ),
                                        child: const Text(
                                          'Lunas', 
                                          style: TextStyle(
                                            color:Color(0xFF147638),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      )
                                      : Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFF1F2 * 2),
                                          borderRadius: BorderRadius.circular(99)
                                        ),
                                        child: const Text(
                                          "Belum Lunas",
                                          style: TextStyle(
                                            color: Color(0xFFB4173A),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ),
                                //name customer
                                Text(
                                  state.billings[index].customerName,
                                  style: TextStyle(
                                    color: C6,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                //line separator
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  height: 2,
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    color: C6,
                                    borderRadius: BorderRadius.circular(99)
                                  ),
                                ),
                                //due date and price
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        DateFormat("d MMMM y","id_ID").format(state.billings[index].dueDate),
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Rp. ${NumberFormat(",###","id_ID").format(state.billings[index].grandTotal)}',
                                        style: TextStyle(
                                          color: C6,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
            }
            return Center(
              child : CircularProgressIndicator(
                color: C1,
              )
            );
          },
        ),
      ),
    );
  }
}
