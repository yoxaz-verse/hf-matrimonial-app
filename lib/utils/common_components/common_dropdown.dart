import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import 'common_text.dart';
import 'dropdown/dropdown_search.dart';

class CommonDropdown extends ConsumerWidget {
  void Function(String?)? onChanged;
  void Function()? onTap;
  int elevation;

  final bool? messagetext;

  final String? dropdownValue;
  final String? titleText;

  bool? isDense;
  double? itemHeight;

  double? itemWidth;
  bool isExpanded;
  bool autofocus;
  bool enableFeedback;
  FocusNode? focusNode;
  Widget? dropdownicon;
  Widget? dropdownsuffix;

  double? iconSize;
  double? menuMaxHeight;
  Color? focusColor;
  Color? dropdownColor;
  Color? iconcolor;
  Color? icondisablecolor;

  double containerwidth;
  double containerheight;

  Color? containercolor;

  TextStyle? textstyle;
  TextStyle? selectedTextstyle;
  Widget? dropdowntitle;
  List<String>? itemslist;
  AlignmentGeometry? alignment;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  Widget? prefix;
  String? titlesuffix;
  BoxBorder? border;
  bool? checkboxval;
  void Function(bool)? onchange;
  String dropdownselecttitle;

  ///
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  void Function(String?) onChangedsearch;
  List<String> items;

  String? selectedItem;
  Future<List<String>> Function(String)? asyncItems;
  Widget Function(BuildContext, String?)? dropdownBuilder;
  DropDownDecoratorProps dropdownDecoratorProps = DropDownDecoratorProps();
  ClearButtonProps clearButtonProps = ClearButtonProps();
  DropdownButtonProps dropdownButtonProps = DropdownButtonProps();
  bool enabled = true;
  bool Function(String, String)? filterFn;
  String Function(String)? itemAsString;
  bool Function(String, String)? compareFn;
  Future<bool?> Function(String?, String?)? onBeforeChange;
  Future<bool?> Function(String?)? onBeforePopupOpening;
  PopupProps<String>? popupProps;

  CommonDropdown({
    Key? key,
    this.onSaved,
    this.validator,
    this.autoValidateMode,
    required this.onChangedsearch,
    required this.items,
    this.selectedItem,
    this.asyncItems,
    this.dropdownBuilder,
    required this.dropdownselecttitle,
    required this.dropdownDecoratorProps,
    required this.clearButtonProps,
    required this.dropdownButtonProps,
    required this.enabled,
    this.filterFn,
    this.dropdownsuffix,
    this.itemAsString,
    this.compareFn,
    this.onBeforeChange,
    this.onBeforePopupOpening,
    this.popupProps,
    this.titlesuffix,
    this.onChanged,
    this.onTap,
    this.dropdowntitle,
    this.border,
    this.checkboxval,
    required this.elevation,
    this.itemHeight,
    this.itemWidth,
    this.focusNode,
    this.onchange,
    this.menuMaxHeight,
    this.enableFeedback = false,
    required this.isExpanded,
    this.autofocus = false,
    this.itemslist,
    this.messagetext,
    this.dropdownValue,
    this.focusColor,
    this.dropdownColor,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.iconcolor,
    this.isDense,
    this.icondisablecolor,
    this.dropdownicon,
    required this.containerwidth,
    required this.containerheight,
    required this.containercolor,
    this.titleText,
    this.textstyle,
    this.selectedTextstyle,
    this.iconSize,
    this.prefix,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        onTap!=null?InkWell(
          onTap: (){onTap!();},
          child: Container(
            width: containerwidth,
            height: containerheight ?? height * 0.06,
            decoration: BoxDecoration(
              color: containercolor,
              border: border,
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: containerwidth,
                    height: containerheight,
                    decoration: BoxDecoration(
                        color: containercolor, borderRadius: borderRadius),
                    child: DropdownSearch<String>(
                      onSaved: onSaved,
                      validator: validator,
                      autoValidateMode: autoValidateMode,
                      onChanged: onChangedsearch,
                      items: items,
                      selectedItem: selectedItem ?? dropdownValue,
                      asyncItems: asyncItems,
                      dropdownBuilder: _style,
                      dropdownDecoratorProps: dropdownDecoratorProps,
                      clearButtonProps: clearButtonProps,
                      dropdownButtonProps: dropdownButtonProps,

                      enabled: enabled,
                      filterFn: filterFn,
                      itemAsString: itemAsString,
                      compareFn: compareFn,
                      onBeforeChange: onBeforeChange,
                      onBeforePopupOpening: onBeforePopupOpening,
                      popupProps: PopupProps.menu(

                        fit: FlexFit.loose,
                        title: dropdowntitle,
                        containerBuilder: (context, child) {
                          return Container(
                            color: containercolor,
                            child: child,
                          );
                        },
                        itemBuilder: (context, item, isSelected) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.006,
                                horizontal: width * 0.025),
                            child: Container(

                              height: height * 0.025,
                              // width: width *0.7,
                              color: containercolor,
                              child: Row(
                                children: [
                                  dropdownicon != null
                                      ? dropdownicon!
                                      : const SizedBox.shrink(),
                                  dropdownsuffix != null
                                      ? Expanded(
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            item!,
                                          maxLines: 1,
                                            style: textstyle ??
                                                juraTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontSize: height * 0.02,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      : Container(
                                    width: itemWidth??width *0.6,

                                    child: Text(
                                            item!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textstyle ??
                                                juraTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontSize: height * 0.02,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w600),
                                          ),
                                      ),
                                  dropdownsuffix != null
                                      ? dropdownsuffix!
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          );
                        },
                        constraints: BoxConstraints.tightFor(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ):Container(
          width: containerwidth,
          height: containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            color: containercolor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: containerwidth,
                  height: containerheight,
                  decoration: BoxDecoration(
                      color: containercolor, borderRadius: borderRadius),
                  child: DropdownSearch<String>(
                    onSaved: onSaved,
                    validator: validator,
                    autoValidateMode: autoValidateMode,
                    onChanged: onChangedsearch,
                    items: items,
                    selectedItem: selectedItem ?? dropdownValue,
                    asyncItems: asyncItems,
                    dropdownBuilder: _style,
                    dropdownDecoratorProps: dropdownDecoratorProps,
                    clearButtonProps: clearButtonProps,
                    dropdownButtonProps: dropdownButtonProps,
                    enabled: enabled,
                    filterFn: filterFn,
                    itemAsString: itemAsString,
                    compareFn: compareFn,
                    onBeforeChange: onBeforeChange,
                    onBeforePopupOpening: onBeforePopupOpening,
                    popupProps: PopupProps.menu(

                      fit: FlexFit.loose,
                      title: dropdowntitle,
                      containerBuilder: (context, child) {
                        return Container(
                          color: containercolor,
                          child: child,
                        );
                      },
                      itemBuilder: (context, item, isSelected) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.006,
                              horizontal: width * 0.025),
                          child: Container(

                            height: height * 0.025,
                            // width: width *0.7,
                            color: containercolor,
                            child: Row(
                              children: [
                                dropdownicon != null
                                    ? dropdownicon!
                                    : const SizedBox.shrink(),
                                dropdownsuffix != null
                                    ? Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    item!,
                                    maxLines: 1,
                                    style: textstyle ??
                                        juraTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: height * 0.02,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600),
                                  ),
                                )
                                    : Container(
                                  width: itemWidth??width *0.6,

                                  child: Text(
                                    item!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textstyle ??
                                        juraTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: height * 0.02,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                dropdownsuffix != null
                                    ? dropdownsuffix!
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        );
                      },
                      constraints: BoxConstraints.tightFor(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _style(BuildContext context, String? selectedItem) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: w * 0.02),
      child: Text(
        selectedItem == "" ? dropdownselecttitle : selectedItem!,
        style: selectedTextstyle ??
            juraTextStyle(
                color: AppColors.black.withOpacity(0.8),
                fontSize: w * 0.04,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _style1(BuildContext context, String? item, bool isSelected) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.025,
      child: Row(
        children: [
          Icon(Icons.location_on),
          Text(
            selectedItem!,
            style: juraTextStyle(
                overflow: TextOverflow.ellipsis,
                color: AppColors.black.withOpacity(0.8),
                fontSize: height * 0.02,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
