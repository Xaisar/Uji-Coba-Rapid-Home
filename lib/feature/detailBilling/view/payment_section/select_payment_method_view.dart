import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.6,
          padding: const EdgeInsets.symmetric(
            vertical: 10
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: C3,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //slider line
              Container(
                width: MediaQuery.of(context).size.width * 0.116,
                height: 2,
                decoration: BoxDecoration(
                  color: const Color(0xFFAFACAC),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              //header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: C6,
                        size: 13 *2,
                      )
                    ),
                    Text(
                      "Pilih Metode Pembayaran",
                      style: TextStyle(
                        color: C6,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      width: 13 * 2,
                    )
                  ],
                ),
              ),
              // body
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  color: C20,
                  child: ListView.separated(
                    itemCount: widget.paymentMethod.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.transparent,
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.paymentBloc.add(
                              SendPaymentEvent(
                                Payment(
                                  billId: widget.billId,
                                  channelListId: widget.paymentMethod[index].value
                                )
                              )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20
                            ),
                            backgroundColor: C3,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //logo
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.20,
                                height: MediaQuery.sizeOf(context).width * 0.20 / 3,
                                child: Image.network(
                                  widget.paymentMethod[index].logo,
                                  frameBuilder:(context, child, frame, wasSynchronouslyLoaded) {
                                    if (wasSynchronouslyLoaded) {
                                      return child;
                                    } else {
                                      return AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 500),
                                        child: frame != null ? child : SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.20,
                                          height: MediaQuery.sizeOf(context).width * 0.20 / 3,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(
                                        Icons.warning_amber_rounded,
                                        size: MediaQuery.sizeOf(context).width * 0.2 / 3,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              //name
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Text(
                                  widget.paymentMethod[index].text,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: C19,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              )
                            ],
                          ),
                        )
                      );
                    },
                  ),
                )
              )
            ],
          ),
        )
      ],
    );
  }
}