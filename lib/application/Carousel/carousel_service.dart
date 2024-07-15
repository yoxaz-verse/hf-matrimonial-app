import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/Carousel/carousel_repo.dart';

abstract class CarouselService {
  Future<Map<String, dynamic>?> getCarousel();

  Future<Map<String, dynamic>?> getCarouselByTitle({
    required String title,
  });
}

class CarouselServiceV1 extends CarouselService {
  CarouselServiceV1(this.carouselRepository);

  final CarouselRepository carouselRepository;

  @override
  Future<Map<String, dynamic>?> getCarousel() {
    return carouselRepository.getCarousel();
  }

  @override
  Future<Map<String, dynamic>?> getCarouselByTitle({
    required String title,
  }) {
    return carouselRepository.getCarouselByTitle(
      title: title,
    );
  }
}

final carouselServiceProvider =
    Provider.autoDispose<CarouselService>((ref) {
  final service = CarouselServiceV1(
    ref.watch(carouselProvider),
  );
  return service;
});
