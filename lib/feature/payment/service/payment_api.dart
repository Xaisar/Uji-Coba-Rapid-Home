import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/cancel_payment_response_model.dart';
import '../model/get_payment_detail_response_model.dart';
import '../model/get_payment_method_response_model.dart';
import '../model/get_payment_response_model.dart';
import '../model/payment_model.dart';

class PaymentApi{

  Future<GetPaymentResponse> paymentService (String token, Payment payment) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPayment();
    final String body = json.encode(payment.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return GetPaymentResponse.fromJson(response);
    });
  }

  Future<CancelPaymentResponse> cancelPaymentService (String token, String billId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlCancelPayment();
    final String body = json.encode({
      'bill_id': billId
    });

    return await NetworkUtils().delete(link, header, body).then((response) {
      return CancelPaymentResponse.fromJson(response);
    });
  }

  Future<GetPaymentMethodResponse> paymentMethodService (String token, String billId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlPaymentMethod(billId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetPaymentMethodResponse.fromJson(response);
    });
  }

  Future<GetPaymentDetailResponse> paymentDetailService (String token, String billId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetPayment(billId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetPaymentDetailResponse.fromJson(response);
    });
  }
}