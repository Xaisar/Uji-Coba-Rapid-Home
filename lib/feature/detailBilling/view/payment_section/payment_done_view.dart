import 'package:flutter/material.dart';

import '../../../../theme/pallet_color.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        horizontal: 13, 
        vertical: 13),
      color: C3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text(
            "Pembayaran",
            style: TextStyle(
              color: C6,
              fontSize: 14,
              fontWeight: FontWeight.w600
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
                const Text(
                  "Sudah melakukan pembayaran",
                  style: TextStyle(
                    color: Color(0xFF147638),
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                  )
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}