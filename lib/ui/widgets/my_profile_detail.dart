import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class MyProfileDetail extends StatelessWidget {
  final String mark;
  final String detail;

  const MyProfileDetail({Key? key, required this.mark, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mark,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
            ),
            Text(
              // ignore: unnecessary_brace_in_string_interps
              detail,
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        )
      ],
    );
  }
}
