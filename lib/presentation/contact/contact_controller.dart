import 'package:flutter/cupertino.dart';
import 'package:heavenlymatrimony/application/dialog/dialog_service.dart';
import 'package:heavenlymatrimony/application/enquires/enquires_service.dart';
import 'package:heavenlymatrimony/application/validate/validate.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'contact_controller.g.dart';

@riverpod
class ContactController extends _$ContactController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSubmit = false;
  bool get isSubmit => _isSubmit;

  // Create Enquires
  Map<String, dynamic>? _createEnquiresResponse;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    // await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    state = const AsyncValue.data(null);
  }

  Future<void> onCreateEnquires(BuildContext context) async {
    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());
    _isSubmit = true;
    if (validate(nameController.text) == null &&
        validateEmail(emailController.text) == null &&
        validatePhone(phoneController.text) == null &&
        validate(messageController.text) == null) {
      _isLoading = true;
      _createEnquiresResponse = await ref
          .read(enquiresServiceProvider)
          .createEnquires(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phoneController.text,
              message: messageController.text,);
      
      if (_createEnquiresResponse?["data"] != null) {
        if (_createEnquiresResponse?["data"] != null) {
          DialogServiceV1().showSnackBar(
              content: "Message Send Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          
        }
      } else {
        DialogServiceV1().showSnackBar(
            content:
                "Message not send due to ${_createEnquiresResponse?["error"] != null}",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);
      }
    }
    _isLoading = false;
    state = const AsyncValue.data(null);
  }
}
