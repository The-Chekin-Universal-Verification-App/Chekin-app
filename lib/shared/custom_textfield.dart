import 'package:chekin/constants/value.dart';
import 'package:chekin/utils/colors.dart';
import 'package:chekin/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AuthTextField extends StatelessWidget {
  //final Function(String) validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final String error;
  final String Function(String?) validFunction;
  final Function(String)? onSavedFunction;
  final Function(String)? onSubmitFunction;
  final Color? color;
  final bool? enabled;
  final double? height;
  const AuthTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.inputType,
    required this.error,
    required this.validFunction,
    this.onSavedFunction,
    this.color,
    this.onSubmitFunction,
    this.enabled = true,
    this.height,
    //required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: heightSize(height ?? 55),
      width: size.width,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        // color: color ?? Colors.grey[50],
        border: Border.all(color: kBlackColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(Values().buttonRadius),
      ),
      child: Center(
        child: TextFormField(
          enabled: enabled,
          controller: controller,
          validator: validFunction,
          onChanged: onSavedFunction,
          onFieldSubmitted: onSubmitFunction,
          keyboardType: inputType,
          showCursor: true,
          cursorColor: kBlackColor.withOpacity(0.5),
          //validator: validator,
          style: TextStyle(color: kBlackColor.withOpacity(0.5)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: kBlackColor.withOpacity(0.5),
              fontSize: fontSize(14),
            ),

            // hintStyle: GoogleFonts.sansita(
            //   color: kWhite,
            // ),

            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class CAuthTextField extends StatelessWidget {
  //final Function(String) validator;
  final TextEditingController? controller;
  final TextInputType inputType;
  final String hint;
  final String? error;
  final String Function(String?)? validFunction;
  final Function(String)? onSavedFunction;
  final Function(String)? onSubmitFunction;
  final Color? color;
  final bool? enabled;
  final double? height;
  final IconData? prefixIcon;
  const CAuthTextField({
    Key? key,
    required this.hint,
    this.controller,
    required this.inputType,
    this.error,
    this.validFunction,
    this.onSavedFunction,
    this.color,
    this.onSubmitFunction,
    this.enabled = true,
    this.height,
    this.prefixIcon,
    //required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: heightSize(height ?? 55),
      width: size.width,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        // color: color ?? Colors.grey[50],
        border: Border.all(color: kBlackColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(Values().buttonRadius),
      ),
      child: Center(
        child: TextFormField(
          enabled: enabled,
          controller: controller,
          validator: validFunction,
          onChanged: onSavedFunction,
          onFieldSubmitted: onSubmitFunction,
          keyboardType: inputType,
          showCursor: true,
          cursorColor: kBlackColor.withOpacity(0.5),
          //validator: validator,
          style: TextStyle(color: kBlackColor.withOpacity(0.5)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: kBlackColor.withOpacity(0.5),
              fontSize: fontSize(14),
            ),
            prefixIcon: Icon(prefixIcon ?? Feather.user, color: kBlackColor),
            suffixIcon: const Icon(Icons.done, color: kBlackColor),

            // hintStyle: GoogleFonts.sansita(
            //   color: kWhite,
            // ),

            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
