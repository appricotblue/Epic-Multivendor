import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper_color.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width,
      this.isLoading,
      this.color,
      this.txtClr})
      : super(key: key);

  final String text;
  final double? width;
  void Function()? onPressed;
  final bool? isLoading;
  final Color? color, txtClr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? 200,
      height: 50,
      color: color ?? AppColors.primaryGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: isLoading == true
          ? SizedBox(
              width: 25,
              height: 25,
              child: CupertinoActivityIndicator(
                color: AppColors.white,
              ))
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: txtClr ?? AppColors.black),
            ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget(
      {Key? key,
      this.text,
      this.color,
      this.height,
      this.width,
      this.textCLR,
      this.onTap,
      this.isTrue})
      : super(key: key);
  final String? text;
  final Color? color, textCLR;
  final double? height, width;
  void Function()? onTap;
  bool? isTrue = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        child: Container(
          height: height ?? 32,
          width: width ?? 30,
          child: Center(
            child: isTrue == true
                ? Text(
                    '$text',
                  )
                : Text(
                    '$text',
                  ),
          ),
        ),
      ),
    );
  }
}

class AppButton2 extends StatelessWidget {
  AppButton2(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width,
      this.height,
      this.isLoading,
      this.color,
      this.txtClr,
      this.radius})
      : super(key: key);

  final String text;
  final double? width, height;
  void Function()? onPressed;
  final bool? isLoading;
  final Color? color, txtClr;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      minWidth: width ?? 200,
      color: color ?? AppColors.primaryGreen,
      shape: RoundedRectangleBorder(
          borderRadius: radius ?? BorderRadius.circular(1)),
      child: isLoading == true
          ? SizedBox(
              width: 25,
              height: 25,
              child: CupertinoActivityIndicator(
                color: AppColors.white,
              ))
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: txtClr ?? AppColors.black),
            ),
    );
  }
}
