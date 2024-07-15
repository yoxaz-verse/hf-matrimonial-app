import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CommonSearchDropdown extends ConsumerWidget {
  void Function()? onTap;

  double containerwidth;
  double containerheight;
  Color? containercolor;

  BorderRadius? borderRadius;

  BoxBorder? border;
  FutureOr<List<Object?>?> Function(String) suggestionsCallback;
  Widget Function(BuildContext, TextEditingController, FocusNode) builder;
  Widget Function(BuildContext, dynamic) itemBuilder;
  void Function(dynamic)? onSelected;
  Duration? animationDuration = const Duration(milliseconds: 200);
  bool? autoFlipDirection = false;
  double? autoFlipMinHeight = 144;
  TextEditingController? controller;
  Duration? debounceDuration = const Duration(milliseconds: 300);
  VerticalDirection? direction = VerticalDirection.down;
  Widget Function(BuildContext, Object)? errorBuilder;
  FocusNode? focusNode;
  bool? hideKeyboardOnDrag = false;
  bool? hideOnEmpty = false;
  bool? hideOnError = false;
  bool? hideOnLoading = false;
  bool? showOnFocus = true;
  bool? hideOnUnfocus = true;
  bool? hideWithKeyboard = true;
  bool? hideOnSelect = true;
  Widget Function(BuildContext, int)? itemSeparatorBuilder;
  bool? retainOnLoading = true;
  Widget Function(BuildContext)? loadingBuilder;
  Widget Function(BuildContext)? emptyBuilder;
  ScrollController? scrollController;
  SuggestionsController<Object?>? suggestionsController;
  Widget Function(BuildContext, Animation<double>, Widget)? transitionBuilder;
  Widget Function(BuildContext, Widget)? decorationBuilder;
  Widget Function(BuildContext, List<Widget>)? listBuilder;
  BoxConstraints? constraints;
  Offset? offset;
  CommonSearchDropdown({
    Key? key,
    this.onTap,
    this.border,
    this.borderRadius,
    required this.containerwidth,
    required this.containerheight,
    required this.containercolor,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSelected,
    required this.builder,
    this.animationDuration,
    this.autoFlipDirection,
    this.autoFlipMinHeight,
    this.controller,
    this.debounceDuration,
    this.direction,
    this.errorBuilder,
    this.focusNode,
    this.hideKeyboardOnDrag,
    this.hideOnEmpty,
    this.hideOnError,
    this.hideOnLoading,
    this.showOnFocus,
    this.hideOnSelect,
    this.itemSeparatorBuilder,
    this.retainOnLoading,
    this.loadingBuilder,
    this.emptyBuilder,
    this.scrollController,
    this.suggestionsController,
    this.transitionBuilder,
    this.decorationBuilder,
    this.listBuilder,
    this.constraints,
    this.offset,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
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
              TypeAheadField(
                suggestionsCallback: suggestionsCallback,
                builder: builder,
                itemBuilder: itemBuilder,
                onSelected: onSelected,
                animationDuration: animationDuration,
                autoFlipDirection: autoFlipDirection ?? false,
                autoFlipMinHeight: autoFlipMinHeight ?? 144,
                controller: controller,
                debounceDuration: debounceDuration,
                direction: direction,
                errorBuilder: errorBuilder,
                focusNode: focusNode,
                hideKeyboardOnDrag: hideKeyboardOnDrag,
                hideOnEmpty: hideOnEmpty,
                hideOnError: hideOnError,
                hideOnLoading: hideOnLoading,
                showOnFocus: showOnFocus ?? true,
                hideOnUnfocus: hideOnUnfocus ?? true,
                hideWithKeyboard: hideWithKeyboard ?? true,
                hideOnSelect: hideOnSelect ?? true,
                itemSeparatorBuilder: itemSeparatorBuilder,
                retainOnLoading: retainOnLoading,
                loadingBuilder: loadingBuilder,
                emptyBuilder: emptyBuilder,
                scrollController: scrollController,
                suggestionsController: suggestionsController,
                transitionBuilder: transitionBuilder,
                decorationBuilder: decorationBuilder,
                listBuilder: listBuilder,
                constraints: constraints,
                offset: offset,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
