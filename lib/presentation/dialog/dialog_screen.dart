import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heavenlymatrimony/presentation/my_account/my_account_screen.dart';
import 'package:heavenlymatrimony/utils/color.dart';
import 'package:heavenlymatrimony/utils/common_components/common_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/common_components/common_button.dart';
import '../../utils/common_components/common_navigator.dart';
import '../../utils/globals.dart';
import '../../utils/text.dart';

class DialogScreen extends ConsumerWidget {
  Widget? ImageWidget;
  String description;
  DialogScreen({
    Key? key,
    this.description="",
    this.ImageWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.only(
        left: w*0.1,
        bottom: h * 0.2,
        top: h * 0.15,
        right: w*0.1
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(ImageWidget!=null)ImageWidget!,
          Container(
            height:h*0.3,
            child: Scrollbar(
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonText(
                        textAlign: TextAlign.justify,
                        text:description,
                        style: juraTextStyle(
                            fontSize: h * 0.020,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          CommonButton(
            containerwidth: w * 0.45,
            containerheight: h * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.01),
              gradient: commonGradient(),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(h * 0.01),
            ),
            text: AppText.close,
            textStyle: juraTextStyle(
                fontSize: h * 0.024,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
            onPressed: () {
       Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
