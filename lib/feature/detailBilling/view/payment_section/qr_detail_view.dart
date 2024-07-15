import 'package:flutter/material.dart';
 
import '../../../../theme/pallet_color.dart';
import '../../../../utils/download_utils/download_utils.dart';
import '../../../payment/model/payment_detail_model.dart';
import '../../../payment/model/payment_method_model.dart';
import '../../../payment/petunjukPayment/petunjuk_payment.dart';
import '../../../payment/petunjukPayment/petunjuk_payment_model.dart';

class QRDetailView extends StatefulWidget {
  const QRDetailView({super.key, required this.paymentDetail, required this.paymentMethod});
  final PaymentMethod paymentMethod;
  final PaymentDetail paymentDetail;

  @override
  State<QRDetailView> createState() => _QRDetailViewState();
}

class _QRDetailViewState extends State<QRDetailView> {

  late List<PetunjukPayment> petunjuk;

  @override
  void initState() {
    super.initState();
    petunjuk = PetunjukPembayaran().ambilPetunjuk(widget.paymentMethod.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C20,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: C1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pembayaran Qris",
          style: TextStyle(
            fontSize: 19, 
            color: C3, 
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //body
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 13, 
              horizontal: 13
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //QR Code
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: C3,
                  alignment: Alignment.center,
                  child: Image.network(
                    widget.paymentDetail.meta!.qrCode,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if(wasSynchronouslyLoaded) {
                        return child;
                      } else {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: frame != null ? child : SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).width - (MediaQuery.sizeOf(context).width / 15),
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.warning_amber_rounded,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                // 
                const SizedBox(
                  height: 10
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cara Pembayaran :",
                    style: TextStyle(
                      color: C6,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 13
                  ),
                  color: C3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(petunjuk[0].petunjuk.length, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "${index + 1}. ${petunjuk[0].petunjuk[index]}",
                          style: TextStyle(
                            color: C6,
                            fontSize: 13
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                //separated
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          //button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(
                vertical: 10, 
                horizontal: 13
              ),
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
              child: ElevatedButton(
                onPressed: () async {
                  DownloadUtils().downloadImages(widget.paymentDetail.meta!.qrCode);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: const Color(0xFF147638),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text(
                  "Download QRIS",
                   style: TextStyle(
                      color: C3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}