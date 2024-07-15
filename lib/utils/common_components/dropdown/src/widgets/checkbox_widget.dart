import 'package:flutter/material.dart';
import '../../../../import_utils.dart';

typedef Widget WidgetCheckBox(BuildContext context, bool isChecked);

class CheckBoxWidget extends StatefulWidget {
  final WidgetCheckBox? layout;
  final WidgetCheckBox? checkBox;
  final bool isChecked;
  final bool isDisabled;
  final ValueChanged<bool?>? onChanged;
  final bool interceptCallBacks;
  final TextDirection textDirection;

  CheckBoxWidget({
    Key? key,
    this.isChecked = false,
    this.isDisabled = false,
    this.layout,
    this.checkBox,
    this.interceptCallBacks = false,
    this.textDirection = TextDirection.ltr,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isCheckedNotifier.value = widget.isChecked;
  }

  @override
  void didUpdateWidget(covariant CheckBoxWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChecked != oldWidget.isChecked)
      isCheckedNotifier.value = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: ValueListenableBuilder(
        valueListenable: isCheckedNotifier,
        builder: (ctx, bool v, w) {
          var w = Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.layout != null
                  ? Expanded(child: widget.layout!(context, v == true))
                  : Container(),
              widget.checkBox != null
                  ? widget.checkBox!(context, v == true)
                  : Container(
                      height: 18,
                      width: 18,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          colors: [
                            v ? AppColors.colorPrimary : AppColors.white,
                            v ? AppColors.colorSecondary : AppColors.white,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          side: BorderSide(
                              color: v
                                  ? AppColors.transparent
                                  : AppColors.dotColor,
                              width: 1.5),
                          focusColor: AppColors.transparent,
                          activeColor: AppColors.transparent,
                          checkColor: AppColors.white,
                          value: v,
                          onChanged: widget.isDisabled ? null : (b) {})),
            ],
          );

          if (widget.interceptCallBacks)
            return w;
          else
            return InkWell(
              onTap: widget.isDisabled
                  ? null
                  : () {
                      isCheckedNotifier.value = !v;
                      if (widget.onChanged != null) widget.onChanged!(v);
                    },
              child: IgnorePointer(child: w),
            );
        },
      ),
    );
  }
}
