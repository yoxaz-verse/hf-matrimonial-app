import 'package:flutter/material.dart';

import '../color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool leadingicon;
  bool centerTitle;
  Color backgroundColor;
  Widget? leadicon;
  Widget? centerwidget;

  Widget? suffixicon;
  String? appbarWidth;
  EdgeInsetsGeometry padding;
  TextStyle? textstyle;
  double? elevation;
  double? scrolledUnderElevation;

  CommonAppBar(
      {Key? key,
      this.title,
      this.appbarWidth,
      this.leadicon,
      this.suffixicon,
      this.scrolledUnderElevation,
      this.elevation,
      required this.centerTitle,
      this.centerwidget,
      this.textstyle,
      required this.padding,
      required this.leadingicon,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: elevation ?? 0,
        toolbarHeight: height * 0.08,
        scrolledUnderElevation: scrolledUnderElevation ?? 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          SizedBox(
            width: width,
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: suffixicon == null && centerTitle == false
                    ? centerwidget != null
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.start
                    : suffixicon == null
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceBetween,
                children: [
                  if (centerTitle == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        leadicon != null
                            ? leadingicon == false
                                ? leadicon!
                                : Row(
                                    children: [
                                      Padding(
                                        padding: padding,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Center(
                                            child: Center(
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: AppColors.black,
                                                size: height * 0.03,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      leadicon!
                                    ],
                                  )
                            : leadingicon == false
                                ? SizedBox()
                                : Padding(
                                    padding: padding,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: AppColors.black,
                                            size: height * 0.03,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        title != null
                            ? centerwidget == null
                                ? Text(
                                    title!,
                                    style: textstyle,
                                  )
                                : centerwidget!
                            : centerwidget == null
                                ? const SizedBox()
                                : centerwidget!,
                      ],
                    ),
                  if (centerTitle == true)
                    leadicon != null
                        ? leadingicon == false
                            ? leadicon!
                            : Row(
                                children: [
                                  Padding(
                                    padding: padding,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: AppColors.black,
                                            size: height * 0.03,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  leadicon!
                                ],
                              )
                        : leadingicon == false
                            ? SizedBox()
                            : Padding(
                                padding: padding,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Center(
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: AppColors.black,
                                        size: height * 0.03,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                  if (centerTitle == true)
                    title != null
                        ? centerwidget == null
                            ? Text(
                                title!,
                                style: textstyle,
                              )
                            : centerwidget!
                        : centerwidget == null
                            ? const SizedBox()
                            : centerwidget!,
                  suffixicon != null
                      ? suffixicon!
                      : SizedBox(
                          width: width * 0.05,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
