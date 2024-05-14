import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.billingModel.billNumber),
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
            : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailBilling!.id,
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                  Text(
                    detailBilling!.customerId,
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                  Text(
                    detailBilling!.customerName,
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                  Text(
                    detailBilling!.billNumber,
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                  Text(
                    detailBilling!.grandTotal.toString(),
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                  Text(
                    detailBilling!.dueDate.toString(),
                    style: TextStyle(
                      color: C1
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator(color: C1,));
        },
      ),
    );
  }
}