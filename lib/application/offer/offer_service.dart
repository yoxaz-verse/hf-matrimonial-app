import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/data/offer/offer_repo.dart';

abstract class OfferService {
  Future<Map<String, dynamic>?> createOffer({
    required String authorization,
    required String code,
    required String discount,
    required bool isPrice,
    required bool isOneTime,
  });

  Future<Map<String, dynamic>?> updateOffer({
    required String authorization,
    required String code,
    required String discount,
    required bool isPrice,
    required bool isOneTime,
  });

  // Future<Map<String, dynamic>?> getOfferById({
  //   required String id,
  // });

  Future<Map<String, dynamic>?> getOffer({
    required String id,
    required String code,
    required String pageNo,
    required String limit,
  });

  Future<Map<String, dynamic>?> getOfferByCode({
    required String code,
  });

  Future<Map<String, dynamic>?> deleteOffer({
    required String authorization,
  });
}

class OfferServiceV1 extends OfferService {
  OfferServiceV1(this.offerRepo);
  final OfferRepo offerRepo;

  @override
  Future<Map<String, dynamic>?> createOffer(
      {required String authorization,
      required String code,
      required String discount,
      required bool isPrice,
      required bool isOneTime}) {
    return offerRepo.createOffer(
        authorization: authorization,
        code: code,
        discount: discount,
        isPrice: isPrice,
        isOneTime: isOneTime);
  }

  @override
  Future<Map<String, dynamic>?> updateOffer(
      {required String authorization,
      required String code,
      required String discount,
      required bool isPrice,
      required bool isOneTime}) {
    return offerRepo.updateOffer(
        authorization: authorization,
        code: code,
        discount: discount,
        isPrice: isPrice,
        isOneTime: isOneTime);
  }

  // @override
  // Future<Map<String, dynamic>?> getOfferById({required String id}) {
  //   return offerRepo.getOfferById(id: id);
  // }

  @override
  Future<Map<String, dynamic>?> getOffer(
      {required String id,
      required String code,
      required String pageNo,
      required String limit}) {
    return offerRepo.getOffer(id: id, code: code, pageNo: pageNo, limit: limit);
  }

  @override
  Future<Map<String, dynamic>?> getOfferByCode({required String code}) {
    return offerRepo.getOfferByCode(code: code);
  }

  @override
  Future<Map<String, dynamic>?> deleteOffer({required String authorization}) {
    return offerRepo.deleteOffer(authorization: authorization);
  }
}

final offerServiceProvider = Provider.autoDispose<OfferService>((ref) {
  final service = OfferServiceV1(
    ref.watch(offerProvider),
  );
  return service;
});
