import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../theme/pallet_color.dart';
import '../../../payment/model/payment_detail_model.dart';
import '../../../payment/model/payment_method_model.dart';
import 'qr_detail_view.dart';

class PaymentActiveView extends StatefulWidget {
  const PaymentActiveView({
    super.key,
    required this.paymentMethod,
    required this.paymentDetail,
  });
  final PaymentMethod paymentMethod;
  final PaymentDetail paymentDetail;

  @override
  State<PaymentActiveView> createState() => _PaymentActiveViewState();
}

class _PaymentActiveViewState extends State<PaymentActiveView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //body
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(
            horizontal: 13, 
            vertical: 13),
          color: C3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //metode pembayaran
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pembayaran Via",
                      style: TextStyle(
                        color: C10,
                        fontSize: 12,
                      )
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.paymentMethod.text,
                          style: TextStyle(
                            color: C10,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.225,
                          child: Image.network(
                          "${widget.paymentMethod.logo}",
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.warning_amber_rounded,
                                size: MediaQuery.sizeOf(context).width * 0.225 / 2,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
               //total
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10 ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Pembayaran",
                      style: TextStyle(
                        color: C10,
                        fontSize: 12,
                      )
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Rp. ${widget.paymentDetail.meta!.grossAmount}",
                      style: TextStyle(
                        color: C10,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                )
              ),
              //expired
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Batas Waktu Pembayaran",
                      style: TextStyle(
                        color: C10,
                        fontSize: 12,
                      )
                    ),
                    const SizedBox(height: 3),
                    Text(
                       DateFormat('HH:mm' ,'id_ID').format(widget.paymentDetail.meta!.expiryTime),
                      style: TextStyle(
                        color: C10,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                )
              ),
              //expired
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Pembayaran",
                      style: TextStyle(
                        color: C10,
                        fontSize: 12,
                      )
                    ),
                    const SizedBox(height: 3),
                    Text(
                       DateFormat('d MMMM y' ,'id_ID').format(widget.paymentDetail.meta!.expiryTime),
                      style: TextStyle(
                        color: C10,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
        //button
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) => QRDetailView(
                  paymentDetail: widget.paymentDetail,
                  paymentMethod: widget.paymentMethod,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: C3,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12.5,
              )
            ),
            child: Text(
              "Lihat QR Code",
              style: TextStyle(
                color: C9,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        )
      ],
    );
  }
}