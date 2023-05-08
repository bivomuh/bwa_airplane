import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/pages/explore_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import '../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
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
                            'IDR 478.000.000',
                            style: whiteTextStyle.copyWith(
                                fontSize: 26, fontWeight: medium),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget titleBonusText() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(
              'Big Bonus 🎉',
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
          ],
        ),
      );
    }

    Widget subtitleBonusText() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              'We give you early credit so that\nyou can buy a flight ticket',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            )
          ],
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
        title: 'Start fly Now',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
        margin: const EdgeInsets.only(top: 50),
        width: 220,
      );
    }

    Widget exploreButton() {
      return SizedBox(
        height: 55,
        width: 220,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: kRedColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExplorePage(),
                ));
          },
          child: Text(
            'Hello',
            style: whiteTextStyle.copyWith(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bonusCard(),
              titleBonusText(),
              subtitleBonusText(),
              startButton(),
              // exploreButton(),
            ],
          ),
        ));
  }
}
