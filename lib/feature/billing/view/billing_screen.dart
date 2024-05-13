import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:intl/intl.dart';

import '../../../theme/pallet_color.dart';
import '../bloc/billing_bloc.dart';
import '../model/billing_model.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillingBloc(),
      child: const BillingScreenView(),
    );
  }
}

class BillingScreenView extends StatefulWidget {
  const BillingScreenView({super.key});

  @override
  State<BillingScreenView> createState() => _BillingScreenViewState();
}

class _BillingScreenViewState extends State<BillingScreenView> {
  List<BillingModel> billings = [];

  @override
  void initState() {
    super.initState();
    context.read<BillingBloc>().add(InitialBillingEvent());
  }

  @override
  Widget build(BuildContext context) {
    final billingBloc = BlocProvider.of<BillingBloc>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: C1,
          title: Text(
            "Billing",
            style: TextStyle(color: C3, fontWeight: FontWeight.bold),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: BlocConsumer<BillingBloc, BillingState>(
          listener: (context, state) {
            if(state is GetBillingFailureState){
              showTopSnackBar(Overlay.of(context),
                CustomSnackBar.error(message: state.error));
            }
            if(state is GetBillingSuccesState){
              billings = state.billings;  
            }
          },
          builder: (context, state) {
            if(state is GetBillingProcessState){
              return Center(
                child : CircularProgressIndicator(
                  color: C1,
                )
              );
            }
            return billings.isEmpty
            ? Center(
              child: Text(
                "Tidak ada Data",
                style: TextStyle(
                  color: C1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
            : RefreshIndicator(
              onRefresh: () async {
                billingBloc.add(InitialBillingEvent());
              },
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                itemCount: billings.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      index == 0 
                      ? const Divider(
                        height: 15,
                        color: Colors.transparent,
                      ) 
                      : const SizedBox(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15
                        ),
                        decoration: BoxDecoration(
                          color: C3,
                          border: Border.all(
                            color: C6,
                            width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              billings[index].customerName,
                              style: TextStyle(
                                color: C6,
                                fontSize: 12
                              ),
                            ),
                            Text(
                              billings[index].billNumber,
                              style: TextStyle(
                                color: C6,
                                fontSize: 12
                              ),
                            ),
                            Text(
                              "Rp. ${NumberFormat("000,000","id_ID").format(billings[index].grandTotal)}",
                              style: TextStyle(
                                color: C6,
                                fontSize: 12
                              ),
                            ),
                            Text(
                              DateFormat("d MMMM y", "id_ID").format(billings[index].dueDate),
                              style: TextStyle(
                                color: C6,
                                fontSize: 12
                              ),
                            ),
              
                          ],
                        ),
                      ),
                      const Divider(
                        height: 15,
                        color: Colors.transparent,
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
