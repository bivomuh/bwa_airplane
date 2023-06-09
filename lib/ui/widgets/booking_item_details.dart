import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingItemDetails extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingItemDetails({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
                fontWeight: semiBold, color: valueColor),
          )
        ],
      ),
    );
  }
}
