import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/payment/payment_repo.dart';

abstract class PaymentService {
  Future<Map<String, dynamic>?> createPayment({
    required String authtoken,
    required String amount,
    required String currency,
  });

  Future<Map<String, dynamic>?> confirmPayment({
    required String authtoken,
    required String razorpay_payment_id,
    required String razorpay_order_id,
    required String id,
  });
  Future<Map<String, dynamic>?> deletePayment({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getPaymentKey({
    required String authtoken,
  });
  // Future<Map<String, dynamic>?> getPaymentById({
  //   required String authtoken,
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getPaymentOfLoginUser({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getAllPayment({
    required String authtoken,
  });
}

class PaymentServiceV1 implements PaymentService {
  PaymentServiceV1(this.paymentRepository);

  final PaymentRepository paymentRepository;

  Future<Map<String, dynamic>?> createPayment({
    required String authtoken,
    required String amount,
    required String currency,
  }) async {
    return await paymentRepository.createPayment(
        authtoken: authtoken, amount: amount, currency: currency);
  }

  Future<Map<String, dynamic>?> confirmPayment({
    required String authtoken,
    required String razorpay_payment_id,
    required String razorpay_order_id,
    required String id,
  }) async {
    return await paymentRepository.confirmPayment(
        authtoken: authtoken,
        razorpay_payment_id: razorpay_payment_id,
        razorpay_order_id: razorpay_order_id,
        id: id);
  }

  Future<Map<String, dynamic>?> deletePayment({
    required String authtoken,
  }) async {
    return await paymentRepository.deletePayment(authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> getPaymentKey({
    required String authtoken,
  }) async {
    return await paymentRepository.getPaymentKey(authtoken: authtoken);
  }

  // Future<Map<String, dynamic>?> getPaymentById({
  //   required String authtoken,
  //   required String id,
  // }) async {
  //   return await paymentRepository.getPaymentById(authtoken: authtoken, id: id);
  // }

  Future<Map<String, dynamic>?> getPaymentOfLoginUser({
    required String authtoken,
  }) async {
    return await paymentRepository.getPaymentOfLoginUser(authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> getAllPayment({
    required String authtoken,
  }) async {
    return await paymentRepository.getAllPayment(authtoken: authtoken);
  }
}

final paymentServiceProvider = Provider.autoDispose<PaymentService>((ref) {
  final service = PaymentServiceV1(
    ref.watch(paymentRepositoryProvider),
  );
  return service;
});
