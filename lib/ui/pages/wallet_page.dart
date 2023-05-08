import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

import '../../cubit/auth_cubit.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(defaultMargin),
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/image_card.png'),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.5),
                        blurRadius: 50,
                        offset: const Offset(0, 10))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(fontWeight: light),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon_plane.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Pay',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 41),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance',
                            style: whiteTextStyle.copyWith(fontWeight: light),
                          ),
                          Text(
                            'IDR 280.000.000',
                            style: whiteTextStyle.copyWith(
                                fontSize: 26, fontWeight: medium),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
