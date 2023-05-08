import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final EdgeInsets margin;
  final bool obscureText;
  final TextEditingController? controller;

  CustomTextFormField(
      {Key? key,
      required this.text,
      required this.hintText,
      this.margin = EdgeInsets.zero,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor))),
          ),
        ],
      ),
    );
  }
}
