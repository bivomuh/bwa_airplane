import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                width: 300,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_success.png'),
                  ),
                ),
              ),
              Text(
                'Well Booked 😍',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
              ),
              const SizedBox(height: 10),
              Text(
                'Are you ready to explore the new\nworld of experiences?',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
              ),
              const SizedBox(height: 50),
              CustomButton(
                title: 'My Bookings',
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
                width: 220,
              ),
            ],
          ),
        ));
  }
}
