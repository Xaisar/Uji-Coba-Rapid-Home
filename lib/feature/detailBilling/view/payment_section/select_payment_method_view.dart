import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../theme/pallet_color.dart';
import '../../../payment/bloc/payment/payment_bloc.dart';
import '../../../payment/model/payment_method_model.dart';
import '../../../payment/model/payment_model.dart';

// ignore: must_be_immutable
class SelectPaymentMethodView extends StatefulWidget{
  const SelectPaymentMethodView({
    super.key,
    required this.paymentMethod,
    required this.paymentBloc,
    required this.billId
    });
  final List<PaymentMethod> paymentMethod;
  final PaymentBloc paymentBloc;
  final String billId;

  @override
  State<SelectPaymentMethodView> createState() => _SelectPaymentMethodViewState();
}

class _SelectPaymentMethodViewState extends State<SelectPaymentMethodView> {
  int? method;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19),
      width: MediaQuery.sizeOf(context).width * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // tittle
          Text(
            'Metode Pembayaran',
            style: TextStyle(
              color: C7,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(
            height: 15
          ),
          //metode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(widget.paymentMethod.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    method = index;                    
                  });
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.375,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 25
                  ),
                  decoration: BoxDecoration(
                    color: C3,
                    borderRadius: BorderRadius.circular(12),
                    border: method == index
                    ? Border.all(
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.green,
                      width: 2
                    ) 
                    : 
                    Border.all(
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: const Color(0xFFB3B3B3),
                      width: 1
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        child: Image.network(
                        widget.paymentMethod[index].logo,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.warning_amber_rounded,
                              size: MediaQuery.sizeOf(context).width * 0.25 / 2,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.paymentMethod[index].text,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: C19,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          //button
          const SizedBox(
            height: 15
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                if(method != null) {
                  widget.paymentBloc.add(
                    SendPaymentEvent(
                      Payment(
                        billId: widget.billId,
                        channelListId: widget.paymentMethod[method!].value
                      )
                    )
                  );
                } else {
                  showTopSnackBar(
                    displayDuration: const Duration(milliseconds: 1500),
                    Overlay.of(context),
                    const CustomSnackBar.error(message: "Pilih metode pembayaran terlebih dahulu")
                  );
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF147638),
                padding: const EdgeInsets.symmetric(vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              child: Text(
                "Bayar",
                style: TextStyle(
                  color: C3,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}