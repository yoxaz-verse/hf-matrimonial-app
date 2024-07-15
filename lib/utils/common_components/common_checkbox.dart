import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CustomCheckbox extends ConsumerWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,

  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child:Container(
        width: w*0.06,
        height:h*0.028,
        decoration: BoxDecoration(
          border: Border.all(
            color:AppColors.gradient1,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(h*0.06),
          color:AppColors.white,
        ),
        child: value
            ?Center(child:Container(
          height: h*0.028,
          width: w*0.06,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(h*0.06),
            color:AppColors.gradient1,
          ),

        ) ,)
            : null,
      ),
    );
  }
}


class CustomCheckboxx extends ConsumerWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckboxx({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: w*0.065,
        height:h*0.03,
        decoration: BoxDecoration(
          border: Border.all(
            color:AppColors.gradient1,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(h*0.006),
          color:AppColors.white,
        ),
        child: value
            ? Icon(
          Icons.check,
          size: h*0.025,
          color:AppColors.gradient1,
        )
            : null,
      ),
    );
  }
}
