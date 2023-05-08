import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInterest extends StatelessWidget {
  final String textInterest;

  const CustomInterest({Key? key, required this.textInterest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 10),
        Container(
          height: 16,
          width: 16,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon_check.png'),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          textInterest,
          style: blackTextStyle.copyWith(
            fontWeight: regular,
          ),
        ),
        const SizedBox(width: 23),
      ],
    );
  }
}
