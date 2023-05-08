import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonNavigationItem extends StatelessWidget {
  final String imageUrl;
  final int index;

  const CustomButtonNavigationItem({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          const SizedBox(height: 18),
          Image.asset(imageUrl,
              width: 24,
              height: 24,
              color: context.watch<PageCubit>().state == index
                  ? kPrimaryColor
                  : kGreyColor),
          const SizedBox(height: 16),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.watch<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          )
        ],
      ),
    );
  }
}
