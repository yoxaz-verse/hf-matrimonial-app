import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/about_us/about_us_service.dart';
import '../../application/dialog/dialog_service.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';

part 'about_page_controller.g.dart';

@riverpod
class AboutController extends _$AboutController {
  TextEditingController TextController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  CarouselController controller = CarouselController();
  List<String> image = [
    AppImg.aboutPageImage,
    AppImg.aboutflower,
    AppImg.about3,
  ];
  String authToken = "";

  List<String> get getCat => image;
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  // String _aboutUsData="";
  String _aboutUsData = "";

  String get aboutUsData => _aboutUsData;
  String _imageName = "";

  String get imageName => _imageName;

  Map<String, dynamic>? _aboutUsDataResponse;

  Map<String, dynamic>? get aboutUsDataResponse => _aboutUsDataResponse;

  List<String> _aboutUsImageData = [];

  List<String> get aboutUsImageData => _aboutUsImageData;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    await getAboutUsData();
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }

  getAboutUsData() async {
    state = const AsyncLoading();
    // await PreferenceManagerUtils.getToken().then((value) {
    //   authToken = value;
    // });
    Map<String, dynamic>? _aboutUsDataResponsetmp =
        await ref.read(aboutUsServiceProvider).getAboutUs();
    if (_aboutUsDataResponsetmp?["data"] != {}) {
      if (_aboutUsDataResponse?["data"]?["aboutUS"] != []) {
        
        try {
          _aboutUsDataResponse = _aboutUsDataResponsetmp;

          _aboutUsData = _aboutUsDataResponse?["data"]?["aboutUS"]?[0]
                  ?["description"] ??
              "";
          if (_aboutUsDataResponse?["data"]?["aboutUS"]?[0]?['images'] != {}) {
            
            _aboutUsImageData.add(_aboutUsDataResponse?["data"]?["aboutUS"]?[0]
                ?['images']['path']);
            _imageName = _aboutUsDataResponse?["data"]?["aboutUS"]?[0]
            ?['images']['imageName'];
            
            
          }
        } catch (e, s) {
          _aboutUsDataResponse = null;
          
        }
      }
    } else {
      DialogServiceV1().showSnackBar(
          content: "Server error occurred please try again in some time...",
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      
    }
    state = const AsyncValue.data(null);
  }
}
