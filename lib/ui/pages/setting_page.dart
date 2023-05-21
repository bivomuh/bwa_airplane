import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/my_profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/page_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget signOutButton() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: CustomButton(
          margin: EdgeInsets.only(
              bottom: 150, left: defaultMargin, right: defaultMargin),
          title: 'Sign Out',
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          width: 220,
        ),
      );
    }

    Widget myProfile() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/image_bivo_profile3.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                          ),
                          Text(
                            state.user.email,
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: regular),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 140,
                            height: 35,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {},
                                child: Text(
                                  'edit profile',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 12, fontWeight: medium),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 63),
                  MyProfileDetail(
                      mark: "saldo", detail: "Rp${state.user.balance}"),
                  MyProfileDetail(mark: "hobby", detail: state.user.hobby),
                  MyProfileDetail(
                      mark: "tanggal bergabung", detail: "8 Mei 2025")
                  // Row(
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "saldo",
                  //           style: blackTextStyle.copyWith(
                  //               fontSize: 14, fontWeight: light),
                  //         ),
                  //         Text(
                  //           "Rp${state.user.balance}",
                  //           style: blackTextStyle.copyWith(
                  //               fontSize: 20, fontWeight: semiBold),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget myProfileDetails() {
      return Text("data");
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          children: [myProfile(), signOutButton(), myProfileDetails()],
        );
      },
    );
  }
}
