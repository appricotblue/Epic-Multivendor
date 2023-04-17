// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../helper_color.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  double? width, height;
  String? hintText;
  TextEditingController? controller;
  FontWeight? fontWeight;
  TextInputType? textInputType;
  Widget? prefixIcon;
  EdgeInsetsGeometry? contentPadding;
  int? maxLines,minLines;
  bool? enabled;
  CommonTextField(
      {Key? key,
        this.width,
        this.height,
        this.hintText,
        this.controller,
        this.fontWeight,
        this.textInputType,
        this.prefixIcon,
        this.contentPadding,
        this.maxLines,
        this.minLines,
        this.enabled
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: TextFormField(
          controller: controller,
          minLines: minLines,
          maxLines:maxLines,
          style:  const  TextStyle(
            fontSize: 16,
          ),
          enabled: enabled,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.normal),
            contentPadding:contentPadding?? const EdgeInsets.only(left: 15, bottom: 7),
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
